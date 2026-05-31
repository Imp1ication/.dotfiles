return {
	"hrsh7th/cmp-nvim-lsp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},

	config = function()
		-- Diagnostic --
		local styles = require("user.utils.styles")
		vim.diagnostic.config({
			virtual_text = false,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				header = "",
				prefix = "",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = styles.diagnostic.error,
					[vim.diagnostic.severity.WARN] = styles.diagnostic.warn,
					[vim.diagnostic.severity.INFO] = styles.diagnostic.info,
					[vim.diagnostic.severity.HINT] = styles.diagnostic.hint,
				},
			},
		})

		-- Keybinds for available lsp server --
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		-- Only map when lsp is attached
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Global mappings
				keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				keymap.set("n", "gl", vim.diagnostic.open_float, opts) -- show diagnostics for line
				keymap.set("n", "gk", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				keymap.set("n", "gj", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				--Buffer local mappings.
				opts.buffer = ev.buf

				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>zt", opts) -- show lsp definitions
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
			end,
		})

		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- lsp specific config
		local servers = {
			lua_ls = {
				filetypes = { "lua" },
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			pyright = {
				filetypes = { "python" },
				settings = {
					pyright = {
						disableOrganizeImports = true, -- Using Ruff
					},
					python = {
						analysis = {
							-- ignore = { "*" }, -- Using Ruff
							typeCheckingMode = "basic", -- "off" if using mypy
						},
					},
				},
			},
			rust_analyzer = {
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						diagnostics = { enable = false },
					},
				},
			},
		}

		for name, conf in pairs(servers) do
			vim.lsp.config(name, conf)
		end

		vim.lsp.enable(vim.tbl_keys(servers))
	end,
}
