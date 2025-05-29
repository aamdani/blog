---
title: Dev Log Entries
permalink: "/entries/"
layout: page
---

# In Descending Order

{% for entry in site.entries | sort: 'date' | reverse %}
<article class="entry-item">
    <h2 class="entry-title">
        <a href="{{ entry.url | relative_url }}">{{ entry.title }}</a>
    </h2>
    <time class="entry-date" datetime="{{ entry.date | date_to_xmlschema }}">
        {{ entry.date | date: '%B %d, %Y' }}
    </time>
    <div class="entry-excerpt">
        {{ entry.excerpt | strip_html | truncatewords: 30 }}
    </div>
</article>
{% endfor %}