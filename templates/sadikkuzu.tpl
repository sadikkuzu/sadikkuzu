### Hi there! This is Sadık from (beautiful) Istanbul 👋

---

[![Update-action status](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml/badge.svg)](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/sadikkuzu/sadikkuzu/master.svg)](https://results.pre-commit.ci/latest/github/sadikkuzu/sadikkuzu/master)

#### 🔭 &nbsp; Check out my recent followers
{{range followers 10}}
- [ [{{.Login}}]({{.URL}}) {{.Name}} ]
{{- end}}

#### 🎧 &nbsp; Good beats

[![Mr. Kuzu's Recently Played Music on Spotify](https://spotify-recently-played-readme.vercel.app/api?user=5cfgfpgmik69ly41rspaiod2a&count=3&unique=1)](https://open.spotify.com/user/5cfgfpgmik69ly41rspaiod2a)

#### 🚀 &nbsp; Open source projects I've contributed to
{{range recentContributions 100 }}
{{- if (ne "sadikkuzu" (slice .Repo.Name 0 9)) -}}
1. [{{.Repo.Name}}]({{.Repo.URL}}/commits?author=sadikkuzu) - {{.Repo.Description}} ({{humanize .OccurredAt}})
{{ end -}}
{{- end}}

[![GitHub Streak](https://streak-stats.demolab.com?user=sadikkuzu&theme=github-dark&hide_border=true&date_format=M%20j%5B%2C%20Y%5D)](https://git.io/streak-stats)
