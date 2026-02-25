return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	version = "v17.33.0",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/codecompanion-history.nvim",
	},

	config = function()
		-- Keymaps
		vim.keymap.set("n", "<leader>aic", ":CodeCompanionChat Toggle<CR>", { desc = "CodeCompanion: Toggle Chat" })
		vim.keymap.set("v", "<leader>aic", ":CodeCompanionChat<CR>", { desc = "CodeCompanion: Open Chat" })
		vim.keymap.set({ "n", "v" }, "<leader>aia", ":CodeCompanionAction<CR>", { desc = "CodeCompanion: Run Action" })
		vim.keymap.set({ "n", "v" }, "<leader>aii", ":CodeCompanion ", { desc = "CodeCompanion: Inline" })

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
			ignore_warnings = true,
			opts = {
				language = "Traditional Chinese",
				system_prompt = prompts.system_prompt,
				log_level = "DEBUG",
			},
			display = {
				opts = {
					show_default_actions = true, -- Show the default actions in the action palette?
					show_default_prompt_library = false, -- Show the default prompt library in the action palette?
				},
				chat = {
					intro_message = " お願い，要是沒有 AI 的話，私...",
					window = {
						layout = "vertical", -- float|vertical|horizontal|buffer
						position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
						height = 0.8,
						width = 0.45,
					},
				},
			},
			strategies = {
				chat = {
					adapter = "copilot",
					roles = {
						llm = "Meow Bot #ΦωΦ",
						user = "Imp #OuO",
					},
					keymaps = {
						send = {
							callback = function(chat)
								vim.cmd("stopinsert")
								chat:submit()
								chat:add_buf_message({ role = "llm", content = "" })
							end,
							index = 1,
							description = "Send",
						},
					},
				},
				inline = {
					adapter = "copilot",
				},
			},
			adapters = {
				http = {
					opts = { show_model_choices = true },
					copilot = function()
						return require("codecompanion.adapters").extend("copilot", {
							schema = {
								model = {
									default = "gpt-4.1", -- gemini-2.5-pro
								},
							},
						})
					end,
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
			},
			extensions = {
				history = {
					enabled = true,
					opts = {
						-- Keymap to open history from chat buffer and save the current chat
						keymap = "gh",
						save_chat_keymap = "sc",
						-- Save all chats by default (disable to save only manually using 'sc')
						auto_save = false,
						-- Number of days after which chats are automatically deleted (0 to disable)
						expiration_days = 90,
						---On exiting and entering neovim, loads the last chat on opening chat
						continue_last_chat = false,
						---When chat is cleared with `gx` delete the chat from history
						delete_on_clearing_chat = true,
						---Directory path to save the chats
						dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",

						-- Summary system
						summary = {
							-- Keymap to generate summary for current chat (default: "gcs")
							create_summary_keymap = "gcs",
							-- Keymap to browse summaries (default: "gbs")
							browse_summaries_keymap = "gbs",
						},

						-- Memory system (requires VectorCode CLI)
						memory = {
							auto_create_memories_on_summary_generation = false,
						},
					},
				},
			},

			prompt_library = prompts.prompt_library,
		})
	end,
}
