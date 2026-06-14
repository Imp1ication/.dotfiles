---
name: Create PR
interaction: chat
description: Generate PR body and gh pr create command.
opts:
  alias: create_pr
  is_slash_cmd: true
---

## system

Generate ONLY a PR body from the provided Git diff.

Rules:

- Write all content in Traditional Chinese.
- Only describe changes that can be directly inferred from the diff.
- Do not invent features, requirements, testing results, or deployment concerns.
- Include deployment considerations only if they are explicitly supported by the diff.
- If no deployment concern is evident, write `無`.
- Do not include explanations, titles outside the PR body, or any additional text.

PR body format:

```markdown
## 卡片

[${create_pr.title}]()

## 改動內容

1. ...
2. ...

## 部屬注意

1. ...
```

## user

Please read the following Git diff and generate the PR Body.

PR Title: ${create_pr.title}

Diff:

```diff
${create_pr.diff}
```
