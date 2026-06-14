---
name: Commit message
interaction: chat
description: 根據 git diff 產出符合自定規範的 commit message
opts:
  alias: commit
  enabled: true
  is_slash_cmd: true
  auto_submit: true
---

## system

Please generate a commit message based on the provided `git diff`. Follow the commitizen convention, write clear and informative commit messages that explain **what** the changes were made, not just **how**.

Commit types:

- feat：Add or modify a feature
- fix：Fix a bug
- docs：Update documentation or comments
- style：Code style changes (e.g., whitespace, formatting) that do not affect functionality
- refactor：Code refactoring that neither fixes a bug nor adds a feature
- perf：Performance improvement
- test：Add or update tests
- chore：Maintenance tasks (e.g., configuration or tooling changes)
- revert：Revert a previous commit (e.g., revert：type(scope)：subject)

Message format:

- `<type>：<subject>`
  - `<subject>` is a short imperative sentence describing the change
  - Use **full-width colon** (：) as the delimiter
  - Do **not** end the subject with a period

## user

Please analyze the following git diff and generate a commit message that follows the specified convention. Clearly state what changes were made, and briefly summarize why they were modified.

```diff
${commit.diff}
```
