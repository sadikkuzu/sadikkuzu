#!/usr/bin/env python3
"""Render README.md from templates/sadikkuzu.md.tpl with GitHub GraphQL data.

Replaces the muesli/readme-scribe action. Standard library only.

Template placeholders (each on its own line):
    {{followers}}      10 most recent followers
    {{contributions}}  repos with recent commits (last year)
    {{stars}}          10 most recently starred repos

Usage:
    GITHUB_TOKEN=... python3 scripts/render_readme.py [template] [output]
"""

from __future__ import annotations

import json
import os
import sys
import urllib.request
from datetime import datetime, timezone

LOGIN = "sadikkuzu"
TEMPLATE = "templates/sadikkuzu.md.tpl"
OUTPUT = "README.md"

FOLLOWER_COUNT = 10
STAR_COUNT = 10
CONTRIBUTION_COUNT = 100
# Repos whose owner starts with these are not listed as contributions.
EXCLUDED_OWNER_PREFIXES = ("sadikkuzu", "SweDinamo", "msgsumat")

QUERY = """
query($login: String!, $followers: Int!, $stars: Int!) {
  user(login: $login) {
    followers(first: $followers) {
      nodes { login name url }
    }
    starredRepositories(first: $stars, orderBy: {field: STARRED_AT, direction: DESC}) {
      edges { starredAt node { nameWithOwner url description isPrivate } }
    }
    contributionsCollection {
      commitContributionsByRepository(maxRepositories: 100) {
        repository { nameWithOwner url description isPrivate }
        contributions(first: 1) { nodes { occurredAt } }
      }
    }
  }
}
"""


def graphql(token: str, query: str, variables: dict) -> dict:
    request = urllib.request.Request(
        "https://api.github.com/graphql",
        data=json.dumps({"query": query, "variables": variables}).encode(),
        headers={
            "Authorization": f"bearer {token}",
            "Content-Type": "application/json",
            "User-Agent": f"{LOGIN}-readme",
        },
    )
    with urllib.request.urlopen(request, timeout=60) as response:
        payload = json.load(response)
    if payload.get("errors"):
        raise RuntimeError(json.dumps(payload["errors"], indent=2))
    return payload["data"]


def escape(text: str | None) -> str:
    """HTML-escape like Go's template.HTMLEscapeString (markscribe output)."""
    return (
        (text or "")
        .replace("&", "&amp;")
        .replace("'", "&#39;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace('"', "&#34;")
    )


def parse_time(value: str) -> datetime:
    return datetime.fromisoformat(value.replace("Z", "+00:00"))


# Same thresholds as github.com/dustin/go-humanize (used by markscribe).
_DAY = 24 * 3600
_WEEK = 7 * _DAY
_MONTH = 30 * _DAY
_YEAR = 12 * _MONTH
_MAGNITUDES = [
    # (upper bound in seconds, format, divisor)
    (1, "now", 1),
    (2, "1 second %s", 1),
    (60, "%d seconds %s", 1),
    (120, "1 minute %s", 1),
    (3600, "%d minutes %s", 60),
    (7200, "1 hour %s", 1),
    (_DAY, "%d hours %s", 3600),
    (2 * _DAY, "1 day %s", 1),
    (_WEEK, "%d days %s", _DAY),
    (2 * _WEEK, "1 week %s", 1),
    (_MONTH, "%d weeks %s", _WEEK),
    (2 * _MONTH, "1 month %s", 1),
    (_YEAR, "%d months %s", _MONTH),
    (18 * _MONTH, "1 year %s", 1),
    (2 * _YEAR, "2 years %s", 1),
    (37 * _YEAR, "%d years %s", _YEAR),
    (float("inf"), "a long while %s", 1),
]


def humanize(when: datetime, now: datetime) -> str:
    """Relative date, flattened to midnight UTC like markscribe."""
    when = when.replace(hour=0, minute=0, second=0, microsecond=0)
    diff = (now - when).total_seconds()
    if diff <= _DAY:
        return "today"
    for bound, fmt, divisor in _MAGNITUDES:
        if bound > diff:
            break
    if "%d" in fmt:
        return fmt % (int(diff // divisor), "ago")
    return fmt.replace("%s", "ago")


def render_followers(user: dict) -> list[str]:
    return [
        f"- [ [{escape(f['login'])}]({escape(f['url'])}) {escape(f['name'])} ]"
        for f in user["followers"]["nodes"]
    ]


def render_contributions(user: dict, now: datetime) -> list[str]:
    items = []
    for entry in user["contributionsCollection"]["commitContributionsByRepository"]:
        repo = entry["repository"]
        name = repo["nameWithOwner"]
        nodes = entry["contributions"]["nodes"]
        if repo["isPrivate"] or name == f"{LOGIN}/{LOGIN}" or not nodes:
            continue
        items.append((parse_time(nodes[0]["occurredAt"]), repo))
    items.sort(key=lambda item: item[0], reverse=True)

    lines = []
    for occurred_at, repo in items[:CONTRIBUTION_COUNT]:
        name = repo["nameWithOwner"]
        if name.startswith(EXCLUDED_OWNER_PREFIXES):
            continue
        lines.append(
            f"1. [**{escape(name)}**]({escape(repo['url'])}/commits?author={LOGIN})"
            f" [![](https://img.shields.io/github/stars/{escape(name)}?style=social)]"
            f"(https://github.com/{escape(name)}/stargazers)"
            f" - {escape(repo['description'])} ({humanize(occurred_at, now)})"
        )
    return lines


def render_stars(user: dict, now: datetime) -> list[str]:
    lines = []
    for edge in user["starredRepositories"]["edges"]:
        repo = edge["node"]
        if repo["isPrivate"]:
            continue
        description = f" - {escape(repo['description'])}" if repo["description"] else ""
        lines.append(
            f"- [{escape(repo['nameWithOwner'])}]({escape(repo['url'])}){description}"
            f" ({humanize(parse_time(edge['starredAt']), now)})"
        )
    return lines[:STAR_COUNT]


def render(template: str, sections: dict[str, list[str]]) -> str:
    for key, lines in sections.items():
        placeholder = "{{" + key + "}}\n"
        if placeholder not in template:
            raise ValueError(f"placeholder {{{{{key}}}}} missing from template")
        template = template.replace(placeholder, "".join(line + "\n" for line in lines))
    return template


def main() -> int:
    template_path = sys.argv[1] if len(sys.argv) > 1 else TEMPLATE
    output_path = sys.argv[2] if len(sys.argv) > 2 else OUTPUT

    token = os.environ.get("GITHUB_TOKEN")
    if not token:
        print("GITHUB_TOKEN is not set", file=sys.stderr)
        return 1

    # Fetch extra stars so private ones can be skipped.
    data = graphql(
        token,
        QUERY,
        {"login": LOGIN, "followers": FOLLOWER_COUNT, "stars": STAR_COUNT * 2},
    )
    user = data["user"]
    now = datetime.now(timezone.utc)

    with open(template_path, encoding="utf-8") as f:
        template = f.read()
    readme = render(
        template,
        {
            "followers": render_followers(user),
            "contributions": render_contributions(user, now),
            "stars": render_stars(user, now),
        },
    )
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(readme)
    return 0


if __name__ == "__main__":
    sys.exit(main())
