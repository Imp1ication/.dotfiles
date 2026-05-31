return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	opts = {
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		-- Keymaps
		vim.keymap.set("n", "<leader>aic", ":CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion: Toggle Chat" })
		vim.keymap.set("v", "<leader>aic", ":CodeCompanionChat<CR>", { desc = "CodeCompanion: Open Chat" })
		vim.keymap.set({ "n", "v" }, "<leader>aia", ":CodeCompanionAction<CR>", { desc = "CodeCompanion: Run Action" })
		vim.keymap.set({ "n", "v" }, "<leader>aii", ":CodeCompanion ", { desc = "CodeCompanion: Inline" })

		-- 開啓 spinner
		local spinner = require("user.utils.spinner")
		spinner:init()

		local prompts = require("user.utils.prompts")
		require("codecompanion").setup({
			ignore_warnings = true,
			display = {
				chat = {
					intro_message = " お願い，要是沒有 AI 的話，私...",
					auto_scroll = false,
					window = {
						layout = "vertical", -- float|vertical|horizontal|buffer
						position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
						height = 0.8,
						width = 0.45,
					},
				},
			},
			interactions = {
				chat = {
					adapter = { name = "copilot", model = "gpt-4.1" }, -- gemini-2.5-pro, gpt-4o, gpt-4.1
					roles = {
						llm = "Meow Bot #ΦωΦ",
						user = "Imp #OuO",
					},
					opts = {
						system_prompt = prompts.system_prompt,
					},
				},
				inline = {
					adapter = { name = "copilot", model = "gemini-2.5-pro" },
				},
			},
			adapters = {
				acp = {
					opencode = function()
						return require("codecompanion.adapters").extend("opencode", {
							defaults = {
								mode = "plan",
							},
						})
					end,
				},
			},
			extensions = {},
			prompt_library = prompts.prompt_library,
		})

		-- Disable line numbers in CodeCompanion buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "codecompanion",
			callback = function()
				vim.opt_local.number = false
				vim.opt_local.relativenumber = false
			end,
		})
	end,
}
