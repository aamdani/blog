---
title: shopify roast - a brief technical dive
date: 2025-05-30 04:05:00 -05:00
tags:
- shopify
- roast
- ai
- technical dive
- ruby
- rails
- software design
- software development
---

# Shopify Roast: A No-Nonsense Technical Dive

Shopify's engineering team released Roast, an open-source Ruby framework for structured AI workflows. Let's skip the marketing fluff and dive into what it actually does.

## What Roast Actually Is

Think "Make for AI prompts" - it's a Ruby framework that wraps AI API calls in YAML-defined workflows with file I/O, templating, and state management between steps.

## Core Components

### 1. Workflow Definition (`workflow.yml`)

```yaml
name: code_review
model: gpt-4o-mini
tools:
  - Roast::Tools::ReadFile
  - Roast::Tools::Grep

steps:
  - read_code
  - analyze_security
  - generate_summary
```

### 2. Directory Structure

```
my_workflow/
├── workflow.yml
├── read_code/
│   └── prompt.md
├── analyze_security/
│   ├── prompt.md
│   └── output.txt  # ERB template
└── generate_summary/
    └── prompt.md
```

### 3. Prompt Files (`prompt.md`)

```markdown
# analyze_security/prompt.md
Analyze this code for security vulnerabilities:

{{file_content}}

Focus on:
- SQL injection risks
- XSS vulnerabilities
- Authentication bypasses
```

## Execution Examples

### Basic Usage

```bash
# Run workflow on a single file
roast execute workflow.yml src/user.rb

# Run on multiple files
roast execute workflow.yml "src/*.rb"

# Run on git diff
roast execute workflow.yml -t "$(git diff --name-only)"
```

### Advanced Step Types

**Parallel Steps:**
```yaml
steps:
  - read_files
  - # Parallel group starts here
    - check_syntax
    - check_style  
    - check_security
  - generate_report  # Runs after parallel group
```

**Conditional Steps:**
```yaml
steps:
  - analyze_file
  - if: "{{file_extension}} == 'rb'"
    then: ruby_specific_check
  - unless: "{{file_size}} < 1000"
    then: large_file_analysis
```

**Iterative Steps:**
```yaml
steps:
  - each: "{{files}}"
    do: analyze_individual_file
  - repeat: 3
    do: retry_api_call
```

## Key Technical Features

### 1. Context Interpolation

Variables available in prompts:
- `{{file_content}}` - Current file content
- `{{file_path}}` - File path
- `{{file_extension}}` - File extension
- `{{previous_step_output}}` - Output from prior steps

### 2. Output Templates (`output.txt`)

```erb
# analyze_security/output.txt
Security Analysis for <%= file_path %>:

<% vulnerabilities.each do |vuln| %>
- <%= vuln.type %>: <%= vuln.description %>
<% end %>

Risk Level: <%= risk_level %>
```

### 3. Model Configuration

```yaml
# Global model
model: gpt-4o-mini

# Per-step override
analyze_complex_logic:
  model: gpt-4-turbo
  json: true  # Force JSON response
```

### 4. Tools Integration

```yaml
tools:
  - Roast::Tools::ReadFile    # Read file contents
  - Roast::Tools::Grep        # Search within files
  - Roast::Tools::WriteFile   # Write output
  - Roast::Tools::Shell       # Execute shell commands
```

## Real-World Example: Code Quality Assessment

### Workflow Definition

```yaml
# workflow.yml
name: quality_check
model: gpt-4o-mini
tools:
  - Roast::Tools::ReadFile
  - Roast::Tools::Grep

steps:
  - extract_functions
  - assess_complexity
  - check_documentation
  - suggest_improvements
```

### Step 1: Extract Functions

```markdown
# extract_functions/prompt.md
Extract all function definitions from this code:

{{file_content}}

Return a JSON array of functions with their:
- name
- line_number
- parameter_count
- complexity_estimate (1-10)
```

### Step 2: Assess Complexity

```markdown
# assess_complexity/prompt.md
Based on these functions: {{previous_step_output}}

Identify functions with complexity > 7 and explain why they're complex.
Suggest specific refactoring approaches.
```

## Execution Flow

1. Load `workflow.yml`
2. For each target file:
   - Read file content
   - Execute steps sequentially
   - Pass context between steps
   - Apply ERB templating to outputs
3. Generate session replay data

## Session Management

```bash
# View previous executions
roast sessions

# Replay specific session
roast replay session_id
```

## What It's Actually Good For

- **Bulk code analysis** across many files
- **Standardized prompt templates** for repetitive AI tasks
- **Multi-step AI workflows** where step N depends on step N-1
- **Team sharing** of AI workflows via version control
- **Reproducible AI analysis** with session replay

## What It's Not

- ❌ Not a general-purpose workflow engine
- ❌ Not a replacement for CI/CD pipelines
- ❌ Not optimized for real-time interactions
- ❌ Not language agnostic (Ruby-only, no polyglot support as yet)

## The Bottom Line

Roast is a structured way to run AI prompts against files with templating and state management. It's useful if you're doing repetitive AI analysis on codebases and want reproducible, shareable workflows.

The framework shines when you need to:
1. Apply consistent AI analysis across multiple files
2. Chain AI operations together with shared context
3. Version control your AI workflows
4. Debug and replay AI analysis sessions

If your team is already in the Ruby ecosystem and you're tired of ad-hoc AI scripting, Roast provides a solid foundation for systematic AI-powered code analysis.

---

*Want to try it out? Check out the [Roast repository](https://github.com/Shopify/roast) for installation instructions and more examples.*

**Roast Analysis Stats:**
- YAML Files Reviewed: 17
- Coffee Consumed: 3 espresso shots
- Hours Spent Reading Ruby Source: 1.5
- Times I Considered Building This Myself: 0
- Shopify Engineers I'm Now Jealous Of: 6
- Workflows I Can't Wait To Try: 4