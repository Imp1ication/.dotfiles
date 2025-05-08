return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},

	config = function()
		-- 新增獨立指令切換 chat/inline 模型
		local openrouter_models = require("user.utils.openrouter_models")

		vim.api.nvim_create_user_command("CodeCompanionChatModel", function()
			openrouter_models.select_model("chat")
		end, { desc = "Select CodeCompanion chat model" })
		vim.api.nvim_create_user_command("CodeCompanionInlineModel", function()
			openrouter_models.select_model("inline")
		end, { desc = "Select CodeCompanion inline model" })

		-- 開啓 spinner
		local spinner = require("user.utils.spinner")
		spinner:init()

		local prompts = require("user.utils.prompts")
		require("codecompanion").setup({
			opts = {
				language = "Traditional Chinese",
				system_prompt = prompts.system_prompt,
			},
			display = {
				chat = {
					window = {
						layout = "vertical", -- float|vertical|horizontal|buffer
						position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
						height = 0.8,
						width = 0.35,
					},
				},
			},
			strategies = {
				chat = {
					adapter = "openrouter_chat",
					keymaps = {
						send = {
							callback = function(chat)
								vim.cmd("stopinsert")
								chat:submit()
							end,
							index = 1,
							description = "Send",
						},
						close = {
							modes = {
								n = "q",
							},
							index = 3,
							callback = "keymaps.close",
							description = "Close Chat",
						},
					},
					roles = {
						llm = "Meow Bot #ΦωΦ",
						user = "Imp #OuO",
					},
				},
				inline = {
					adapter = "openrouter_inline",
				},
			},
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_result_in_chat = true,
					},
				},
			},
			adapters = {
				openrouter_chat = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://openrouter.ai/api",
							api_key = "OPENROUTER_API_KEY",
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = openrouter_models.get_model("chat"),
							},
						},
					})
				end,
				openrouter_inline = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://openrouter.ai/api",
							api_key = "OPENROUTER_API_KEY",
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = openrouter_models.get_model("inline"),
							},
						},
					})
				end,
			},
		})
	end,
}
