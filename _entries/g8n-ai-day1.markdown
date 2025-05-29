---
title: g8n.ai, day 1.
date: 2025-05-28 10:25:00 -05:00
tags:
- documentation
- ai
- mcp
- model context protocol
- g8n.ai
- g8n
- development
- api
- technical writing
layout: entry
---

# Why Your Documentation Needs to Speak Both Human and Robot

So I'm building a documentation platform. Yeah, I know what you're thinking - "Another one? Don't we have enough of these already?" And you'd be right. So what? We all need to make money somehow.

Also, one crucial detail hit me recently, last week actually, while watching my AI coding assistant absolutely *butcher* an API integration. Let's be honest, I was vibe coding because I was lazy, and I had to go do it manually. And that annoyed me enough to have an epiphany and offer a solution that I could hopefully make money from and also hopefully improve developers' lives (convenience? time?).

The problem isn't that we need more documentation platforms. The problem is that our documentation was built for a world that no longer exists - a world where only humans read docs. We need better docs for agentic AI.

## The Moment Everything Changed

Picture this: I'm using Cursor with Claude Sonnet 3.7 to integrate a payment API. The docs *look* beautiful - great design, nice search, even dark mode which everyone loves (except the **fools** who claim otherwise). But my AI assistant keeps suggesting deprecated methods, missing required parameters, and building requests that would never work in production.

Why? Because AI agents don't read documentation the same way we do. They can't infer context from that helpful yellow warning box. They don't understand that the code example from 2019 at the bottom of the page is outdated. They definitely don't get that when the docs say "usually" you should include a parameter, it actually means "always, unless you want everything to break." And that's just the crap that the content generation for this post included, not even the other stuff I've had to deal with the agentic AI messing up. 

And that's when it clicked - we're entering an era where AI agents are becoming active participants in development, but we're still building documentation like it's 2010.

## The Two-Audience Problem

Here's what human developers need from documentation:
- **Scannable structure** - headers, bold text, visual hierarchy
- **Context and explanations** - the "why" behind the "how"
- **Progressive disclosure** - start simple, add complexity
- **Visual aids** - diagrams, screenshots, those fancy animated API explorers

Here's what AI agents need:
- **Structured data** - consistent, parseable formats
- **Explicit relationships** - which version deprecates what
- **Complete examples** - every parameter, every edge case
- **Machine-readable metadata** - last updated, version compatibility

See the problem? These aren't just different needs - they're often *conflicting* needs. Humans want concise; machines want comprehensive. Humans infer; machines need explicit.

## Enter the Model Context Protocol

This is where MCP (Model Context Protocol) comes in, and honestly, it's the most exciting thing to happen to documentation since... well, since we stopped printing it.

MCP lets documentation systems expose structured endpoints specifically for AI consumption. Imagine your AI assistant being able to ask your docs:
- "What parameters does this endpoint accept?"
- "Show me all breaking changes between v2 and v3"
- "Validate if this code matches the documented patterns"

Instead of scraping and guessing, AI agents get structured, reliable responses. It's like having a documentation API for robots.

## Building for Both Worlds

So that's what I'm building with g8n.ai. Documentation infrastructure that serves both audiences without compromising either. Here's the technical approach:

```ruby
# Human-friendly markdown with AI-readable metadata
class DocumentationSection < ApplicationRecord
  # Traditional content for humans
  has_rich_text :content
  
  # Structured data for machines
  store :metadata, accessors: [:parameters, :responses, :examples]
  
  # Semantic embeddings for both
  has_neighbors :embedding
  
  # Version relationships machines can traverse
  has_many :deprecations
  has_many :replacements
end
```

The beauty is that these aren't separate systems. The same source of truth serves both audiences through different interfaces. Humans get their beautiful web UI; machines get their structured MCP endpoints.

## The Real Cost of Ignoring This

Every day we wait, the problem compounds. More developers are using AI assistants. More code is being generated from outdated or misunderstood documentation. More time is wasted debugging issues that shouldn't exist.

I've seen teams lose entire sprints because their AI-assisted developers kept implementing against deprecated APIs. Not because the developers were careless, but because the documentation wasn't built for how modern development actually happens.

## What's Next

Tomorrow I'm diving into the technical architecture - how to build quality enforcement that works for both human readability *and* machine parseability. Spoiler: it involves more Ruby metaprogramming than you'd expect (*but in a good way*).

If you're tired of documentation that fails your AI assistant (or your human teammates), drop me a line at [about.me/ahad.amdani](https://about.me/ahad.amdani). I'd love to hear your documentation horror stories.

We're building the future of documentation at g8n.ai. It's time our docs evolved with our tools.

---

**Today's Stats:**
- Coffee: 1 Bottled Starbucks Mocha Latte
- Lines of Code: 427 (mostly Rails migrations)
- MCP Endpoints Designed: 4
- Times I Questioned This Idea: 2
- Times I Got Re-Excited About It: 3