### Hi there! This is Sadık from (beautiful) Istanbul 👋

---

[![Update-action status](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml/badge.svg)](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/sadikkuzu/sadikkuzu/master.svg)](https://results.pre-commit.ci/latest/github/sadikkuzu/sadikkuzu/master)

#### 🔭 &nbsp; Check out my recent followers
{{range followers 5}}
- [ [{{.Login}}]({{.URL}}) {{.Name}} ]
{{- end}}


#### 🚀 &nbsp; [Getir](https://technology.getir.com)

- [Getir 2021](https://medium.com/getir/getir-2021-cae852cc4e6c)
- [Agile Practices in Non-Software Industries](https://medium.com/getir/agile-practices-in-non-software-industries-5e71c522aea2)
- [Why so cross-functional?](https://medium.com/getir/why-so-cross-functional-e411271265fc)
- [Effective Product Backlog Management for the Best Chefs in the Kitchen](https://medium.com/getir/effective-product-backlog-management-for-best-chefs-in-the-kitchen-d44a023d9c0b)
- [Design Thinking and Agile](https://medium.com/getir/design-thinking-and-agile-21d5159f429)


#### ⛅ &nbsp; [The Amazon Builders' Library](https://aws.amazon.com/builders-library/)
{{range rss "https://aws.amazon.com/blogs/aws/feed/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 🔍 &nbsp; Bitbucket
{{range rss "https://bitbucket.org/blog/feed/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 📰 &nbsp; Stackoverflow
{{range rss "https://stackoverflow.blog/code-for-a-living/feed/" 2}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}{{range rss "https://stackoverflow.blog/engineering/feed/" 1}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}
