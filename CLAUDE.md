# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based personal blog for Ahad L. Amdani hosted at https://ahad.dev. The site uses Jekyll's default configuration with custom collections for posts and uploads, optimized for SEO and AI discoverability.

## Development Commands

```bash
# Install Jekyll (if not already installed)
gem install jekyll bundler

# Install project dependencies
bundle install

# Serve the site locally
bundle exec jekyll serve

# Build the site
bundle exec jekyll build
```

## Site Structure

- **Collections**: Posts and Uploads (both with output enabled)
- **Default layouts**: 
  - Posts use 'post' layout with permalink pattern `/posts/:title/`
  - Pages use 'page' layout
- **Timezone**: America/Chicago

## Content Management

- All posts should be placed in the `_posts` directory (to be created)
- Uploads go in the `_uploads` directory (to be created) 
- Pages like `index.markdown` and `welcome.markdown` are at the root level
- Blog entries are in the `_entries` collection with output enabled

## SEO Configuration

The site is fully optimized for search engines and AI discovery:

### Core SEO Files
- **robots.txt**: Located at root, allows all crawlers and points to sitemap at https://ahad.dev/sitemap.xml
- **llms.txt**: AI-friendly content description for LLM discovery and indexing
- **Sitemap**: Auto-generated via jekyll-sitemap plugin

### SEO Plugins
- `jekyll-sitemap`: Generates XML sitemap automatically
- `jekyll-seo-tag`: Provides comprehensive meta tags

### Meta Tags Included
- Open Graph tags for social media sharing
- Twitter Card support
- Canonical URLs
- Author attribution
- Dynamic descriptions from page excerpts

### Maintaining SEO Files

When updating content or site structure:

1. **Update llms.txt** when:
   - Adding new content areas or collections
   - Changing site focus or topics
   - Adding significant new pages or sections

2. **Update robots.txt** if:
   - Changing domain (currently https://ahad.dev)
   - Adding directories to exclude from crawling
   - Modifying sitemap location

3. **SEO best practices**:
   - Ensure all pages have meaningful titles and descriptions
   - Use proper heading hierarchy (h1, h2, h3)
   - Add meta descriptions to front matter when needed
   - Keep URLs clean and descriptive