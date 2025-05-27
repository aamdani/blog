---
title: Posts
permalink: "/posts/"
layout: page
---

# Blog Posts

{% for post in site.posts %}
<article class="entry-item">
    <h2 class="entry-title">
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
    </h2>
    <time class="entry-date" datetime="{{ post.date | date_to_xmlschema }}">
        {{ post.date | date: '%B %d, %Y' }}
    </time>
    <div class="entry-excerpt">
        {{ post.excerpt | strip_html | truncatewords: 30 }}
    </div>
</article>
{% endfor %}