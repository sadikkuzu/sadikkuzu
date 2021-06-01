### Hi there! This is Sadık from (beautiful) Istanbul 👋

[![sadikkuzu's GitHub stats](https://github-readme-stats.vercel.app/api?username=sadikkuzu&show_icons=true&theme=dark&hide=stars&hide_title=true)](https://github.com/sadikkuzu)
[![sadikkuzu's top langs](https://github-readme-stats.vercel.app/api/top-langs/?username=sadikkuzu&langs_count=6&layout=compact&theme=dark&hide_title=true)](https://github.com/sadikkuzu)

---

[![Update-action status](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml/badge.svg)](https://github.com/sadikkuzu/sadikkuzu/actions/workflows/sadikkuzu.yml)

#### 🔭 Check out my recent followers
{{range followers 5}}
- [{{.Login}}]({{.URL}}) {{.Name}}
{{- end}}


#### 🔻 [The Gradient](https://thegradient.pub)
{{range rss "https://thegradient.pub/rss/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 🔛 NATS
{{range rss "https://nats.io/blog/index.xml" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 📰 Stackoverflow blog
{{range rss "https://stackoverflow.blog/engineering/feed/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 📢 Facebook
{{range rss "https://engineering.fb.com/feed/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### ⛅ [The Amazon Builders' Library](https://aws.amazon.com/builders-library/)


#### 🔍 Bitbucket
{{range rss "https://bitbucket.org/blog/feed/" 3}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}

<!--

References:
https://github.com/bep/bep
https://github.com/muesli/muesli
https://github.com/muesli/markscribe

**sadikkuzu/sadikkuzu** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.
Here are some ideas to get you started:
- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
