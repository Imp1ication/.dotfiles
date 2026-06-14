return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	config = function()
		require("copilot").setup({
			panel = { enabled = false },
			suggestion = { enabled = false },
			-- filetypes = {
			-- 	gitcommit = true,
			-- 	markdown = true,
			-- 	yaml = true,
			-- 	help = false,
			-- 	csv = false,
			-- 	codecompanion = false,
			-- 	["."] = false,
			-- 	["*.ini"] = false,
			-- 	["*.config"] = false,
			-- },
		})
	end,
}
