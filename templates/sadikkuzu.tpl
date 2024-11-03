### Hi there! I'm Sadık from (beautiful) Istanbul 👋

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
{{- if (ne "SweDinamo" (slice .Repo.Name 0 9)) -}}
{{- if (ne "SWE574-Fall" (slice .Repo.Name 0 11)) -}}
{{- if (ne "enshkn" (slice .Repo.Name 0 6)) -}}
{{- if (ne "msgsumat" (slice .Repo.Name 0 8)) -}}
1. [**{{.Repo.Name}}**]({{.Repo.URL}}/commits?author=sadikkuzu) [![](https://img.shields.io/github/stars/{{.Repo.Name}}?style=social)](https://github.com/{{.Repo.Name}}/stargazers) - {{.Repo.Description}} ({{humanize .OccurredAt}})
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{- end}}

#### ⭐ Recent stars
{{range recentStars 10}}
- [{{.Repo.Name}}]({{.Repo.URL}}){{with .Repo.Description}} - {{.}}{{end}} ({{humanize .StarredAt}})
{{- end }}

[![GitHub Streak](https://streak-stats.demolab.com?user=sadikkuzu&theme=github-dark&hide_border=true&date_format=M%20j%5B%2C%20Y%5D)](https://git.io/streak-stats)

[![@sadikkuzu's Holopin board](https://holopin.io/api/user/board?user=sadikkuzu)](https://holopin.io/@sadikkuzu)

[![](https://img.shields.io/stackexchange/stackoverflow/r/7030591?style=plastic)](https://stackoverflow.com/users/7030591/sadik-kuzu)
[![](https://img.shields.io/twitter/follow/sadikkuzu_mba?style=social)](https://twitter.com/sadikkuzu_mba)

![BOUN](https://github.com/sadikkuzu/sadikkuzu/assets/23168063/c4686502-9896-4af6-86d3-229dac1baa32)
