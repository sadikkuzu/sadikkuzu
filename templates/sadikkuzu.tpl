### Hi there! This is Sadık from (beautiful) Istanbul 👋

[![sadikkuzu's GitHub stats](https://github-readme-stats.vercel.app/api?username=sadikkuzu&show_icons=true&theme=dark&hide=stars&hide_title=true)](https://github.com/sadikkuzu)
[![sadikkuzu's top langs](https://github-readme-stats.vercel.app/api/top-langs/?username=sadikkuzu&langs_count=6&layout=compact&theme=dark&hide_title=true)](https://github.com/sadikkuzu)

---

#### 🔭 Check out my recent followers
{{range followers 7}}
- [{{.Login}}]({{.URL}}) {{.Name}}
{{- end}}


#### 🔻 [The Gradient](https://thegradient.pub)
{{range rss "https://thegradient.pub/rss/" 5}}
- [{{.Title}}]({{.URL}}) ({{humanize .PublishedAt}})
{{- end}}


#### 🎼 [MATH 538 Algebraic Topology II](https://www.youtube.com/playlist?list=PLBMmiR8tC9UmP3YhW1R2tNSqTCpq-kaDh) by [Prof.Dr. Yıldıray Ozan](http://users.metu.edu.tr/ozan/indexEng.html)
{{range reverse (rss "https://www.youtube.com/feeds/videos.xml?playlist_id=PLBMmiR8tC9UmP3YhW1R2tNSqTCpq-kaDh" 60)}}
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