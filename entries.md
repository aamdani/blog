---
title: a collection of logs and writings.
permalink: "/entries/"
layout: paginated_entries
pagination_info:
  page: 1
---

# In Descending Order

<div class="entry-container">
  {% assign sorted_entries = site.entries | sort: 'date' | reverse %}
  {% assign paginated_entries = sorted_entries | slice: 0, 5 %}

  {% for entry in paginated_entries %}
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
</div>

<!-- Pagination -->
<div class="pagination">
  {% assign total_entries = sorted_entries | size %}
  {% assign total_pages = total_entries | divided_by: 5.0 | ceil %}
  {% for page_num in (1..total_pages) %}
    {% assign offset = page_num | minus: 1 | times: 5 %}
    {% if forloop.index == 1 %}
      <span class="current-page">{{ page_num }}</span>
    {% else %}
      <a href="{{ '/entries/page/' | append: page_num | relative_url }}" aria-label="Page {{ page_num }}">{{ page_num }}</a>
    {% endif %}
  {% endfor %}
</div>