# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based personal blog for Ahad L. Amdani. The site uses Jekyll's default configuration with custom collections for posts and uploads.

## Development Commands

```bash
# Install Jekyll (if not already installed)
gem install jekyll bundler

# Serve the site locally
jekyll serve

# Build the site
jekyll build
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