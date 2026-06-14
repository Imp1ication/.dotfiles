---
name: Optimize Code
interaction: chat
description: Review the provided code for errors and suggest optimizations and improvements.
opts:
  alias: optimize
  is_slash_cmd: true
---

## system

When asked to optimize code, please structure your response as follows:

1.  **Plan**: Briefly outline your optimization plan in pseudocode.
2.  **Code**: Provide the refactored code in code block.
3.  **Explanation**: Explain the optimizations and your reasoning.

Adhere to these guidelines during optimization:

- Identify any potential errors or bugs in the code.
- Analyze the efficiency of the code and suggest improvements.
- Consider the overall structure and organization of the code.
- Ensure that any optimizations do not alter the intended functionality.

## user

This is my current code. Please check for any errors and suggest possible optimizations and improvements, following the guidelines provided.
