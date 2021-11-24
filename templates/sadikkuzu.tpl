### Hi there! This is Sadık from (beautiful) Istanbul 👋

---

[![Update-action status](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml/badge.svg)](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/sadikkuzu/sadikkuzu/master.svg)](https://results.pre-commit.ci/latest/github/sadikkuzu/sadikkuzu/master)

#### 🔭 Check out my recent followers
{{range followers 5}}
- [ [{{.Login}}]({{.URL}}) {{.Name}} ]
{{- end}}


#### 🚀 [Getir](https://technology.getir.com)
{{range rss "https://medium.com/feed/getir" 5}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### ⛅ [The Amazon Builders' Library](https://aws.amazon.com/builders-library/)
{{range rss "https://aws.amazon.com/blogs/aws/feed/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 🔍 Bitbucket
{{range rss "https://bitbucket.org/blog/feed/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 📰 Stackoverflow
{{range rss "https://stackoverflow.blog/code-for-a-living/feed/" 2}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}{{range rss "https://stackoverflow.blog/engineering/feed/" 1}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}
