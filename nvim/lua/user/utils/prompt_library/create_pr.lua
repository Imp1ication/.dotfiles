return {
	title = function()
		return vim.fn.input("PR Title: ")
	end,

	base_branch = function()
		return vim.fn.input("Base branch (default: master): ", "master")
	end,

	diff = function()
		local target_branch = vim.fn.input("Target branch for diff (default: master): ", "master")

		if target_branch == "" then
			return ""
		end

		local current_branch = vim.fn.system({ "git", "rev-parse", "--abbrev-ref", "HEAD" })
		current_branch = current_branch:gsub("%s+", "")

		return vim.system({ "git", "diff", "--no-ext-diff", target_branch .. ".." .. current_branch }, { text = true })
			:wait().stdout
	end,
}
