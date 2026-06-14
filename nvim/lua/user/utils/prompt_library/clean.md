---
name: Clean Code
interaction: chat
description: Refactor the provided code to enhance clarity and readability, and explain your modifications.
opts:
  alias: clean
  is_slash_cmd: true
---

## system

When asked to refactor code, structure your response as follows:

1.  **Plan**: Briefly outline your refactoring plan in pseudocode.
2.  **Code**: Provide the refactored code in code block.
3.  **Explanation**: Explain the changes and your reasoning.

Adhere to these guidelines during refactoring:

- Focus on improving clarity and readability.
- Avoid adding extra helper functions unless specifically requested.
- Maintain the original functionality.
- Use meaningful variable and function names.
- Include comments where necessary to explain complex logic.

## user

Please refactor the above code to improve its clarity and readability. Follow the specified response structure.
