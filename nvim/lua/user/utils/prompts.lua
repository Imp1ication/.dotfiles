local M = {}

-- 自訂 System Prompt
M.system_prompt = function(opts)
	local language = "Traditional Chinese"
	return string.format(
		[[You are an AI programming assistant named "Meow Bot". You are currently plugged into the Neovim text editor on a user's machine.

Your core tasks include:
- Answering general programming and computer science questions.
- Explaining how the code in a Neovim buffer works.
- Reviewing the selected code in a Neovim buffer.
- Generating unit tests for the selected code.
- Proposing fixes for problems in the selected code.
- Refactoring and optimizing code.
- Scaffolding code for a new workspace.
- Finding relevant code based on the user's query.
- Proposing solutions to failing tests.
- Running tools or commands as requested.
- Assisting with data analysis and algorithmic reasoning.
- Answering questions about Neovim.

You must:
- All non-code text must be written in the %s language indicated.
- Follow the user's instructions carefully and precisely.
- Respond in a concise, impersonal, and professional tone. Avoid greetings, small talk, or unnecessary prose unless clarification is needed.
- Keep your answers short and impersonal, especially if the user's context is outside your core tasks.
- Use Markdown formatting in your answers.
- Please use Markdown syntax when outputting your response.
- Start each code block with the appropriate language tag and format it using markdown syntax.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's directly relevant to the task at hand. You may omit code that isn’t necessary for the solution.
- Use actual line breaks in your responses; only use "\n" when you want a literal backslash followed by 'n'.
- Never use emojis in your response, comments, or code.
- When writing functions in dynamically typed languages (e.g., Python), explicitly annotate all parameter and return types when feasible.

When given a task:
1. Think step-by-step and, unless the user requests otherwise or the task is very simple, describe your plan in detailed pseudocode.
2. Output the final code in a single code block, ensuring that only relevant code is included.
3. End your response with a short suggestion for the next user turn that directly supports continuing the conversation.
4. Provide exactly one complete reply per conversation turn.]],
		language
	)
end

M.prompt_library = {
	["Commit"] = {
		interaction = "chat",
		description = "根據 git diff 產出符合自定規範的 commit message",
		opts = {
			is_slash_cmd = true,
			alias = "commit",
		},
		prompts = {
			{
				role = "system",
				content = function()
					return [[Please generate a commit message based on the provided `git diff`. Follow the commitizen convention, write clear and informative commit messages that explain **what** and **why** the changes were made, not just **how**.
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
- <type>：<subject>
  - `<subject>` is a short imperative sentence describing the change
  - Use **full-width colon** (：) as the delimiter
  - Do **not** end the subject with a period
]]
				end,
			},
			{
				role = "user",
				content = [[Please use @{get_changed_files} to obtain the current git diff, and generate a commit message that follows the specified convention based on the diff. Clearly state what changes were made, and briefly summarize how they were modified.]],
			},
		},
	},
	["Exp"] = {
		interaction = "chat",
		description = "請簡要說明以上程式碼的功能。",
		opts = {
			alias = "exp",
			is_slash_cmd = true,
		},
		prompts = {
			{
				role = "user",
				content = [[Please provide a concise explanation of the above code.]],
			},
		},
	},
	["Exp+"] = {
		interaction = "chat",
		description = "請詳細說明以上程式碼的功能和運作方式。",
		opts = {
			alias = "exp+",
			is_slash_cmd = true,
		},
		prompts = {
			{
				role = "user",
				content = [[Please provide a detailed explanation of the above code and how it works.]],
			},
		},
	},
	["Error"] = {
		interaction = "chat",
		description = "請解釋以上錯誤訊息並提供解決方案。",
		opts = {
			alias = "error",
			is_slash_cmd = true,
		},
		prompts = {
			{
				role = "user",
				content = [[Please explain the error in the above text and provide a solution.]],
			},
		},
	},
	["Clean"] = {
		interaction = "chat",
		description = "請重構以上程式碼以提升其清晰度和可讀性，並解釋您的修改原因。",
		opts = {
			alias = "clean",
			is_slash_cmd = true,
		},
		prompts = {
			{
				role = "user",
				content = [[Please refactor the above code to improve its clarity and readability. Also, explain why you made these changes.]],
			},
		},
	},
	["Rename"] = {
		interaction = "chat",
		description = "請為以上變數和函式提供更具描述性的名稱。",
		opts = {
			alias = "rename",
			is_slash_cmd = true,
		},
		prompts = {
			{
				role = "user",
				content = [[Please provide better names for the above variables and functions.]],
			},
		},
	},
	["Document"] = {
		interaction = "chat",
		description = "請為以上程式碼撰寫適當的文件說明。",
		opts = {
			alias = "doc",
			is_slash_cmd = true,
		},
		prompts = {
			{
				role = "system",
				content = [[When writing documentation, use Google-style docstrings for modules, classes, and functions. Write descriptions in Traditional Chinese, but keep section headers (e.g., Args, Returns, Raises) in English as per convention.]],
			},
			{
				role = "user",
				content = [[Please provide documentation for the above code.]],
			},
		},
	},
	["Optimize"] = {
		interaction = "chat",
		description = "請檢查以上程式碼是否有錯誤，並提出優化和改進的建議。",
		opts = {
			alias = "optimize",
			is_slash_cmd = true,
		},
		prompts = {
			{
				role = "user",
				content = [[This is my current code. Please check for any errors and suggest possible optimizations and improvements.]],
			},
		},
	},
	["Code Review"] = {
		interaction = "chat",
		description = "Perform a code review",
		opts = {
			auto_submit = true,
			user_prompt = false,
		},
		prompts = {
			{
				role = "user",
				content = function()
					local target_branch =
						vim.fn.input("Target branch for merge base diff (default: master): ", "master")

					return string.format(
						[[You are a senior software engineer performing a code review. Analyze the following code changes.
Identify any potential bugs, performance issues, security vulnerabilities, or areas that could be refactored for better readability or maintainability.
Explain your reasoning clearly and provide specific suggestions for improvement.
Consider edge cases, error handling, and adherence to best practices and coding standards.
Here are the code changes:
```diff
%s
```
]],
						vim.fn.system("git diff --merge-base " .. target_branch)
					)
				end,
			},
		},
	},
}

return M
