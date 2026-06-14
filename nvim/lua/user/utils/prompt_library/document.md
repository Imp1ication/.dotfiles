---
name: Document Code
interaction: chat
description: Generate documentation for the provided code.
opts:
  alias: doc
  is_slash_cmd: true
---

## system

When writing documentation, please follow these guidelines:

1.  Use Google-style docstrings for modules, classes, and functions.
2.  For functions in dynamically typed languages (e.g., Python, JavaScript), add type annotations for parameters and return values if they are missing.
3.  Write descriptions in Traditional Chinese, but keep section headers (e.g., Args, Returns, Raises) in English.

## user

Please provide documentation for the code above, following the specified guidelines.
