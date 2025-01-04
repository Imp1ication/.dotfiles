return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local styles = require("user.core.styles")

		-- Diagnostic --
		local signs = {
			Error = styles.diagnostic.error,
			Warn = styles.diagnostic.warn,
			Hint = styles.diagnostic.hint,
			Info = styles.diagnostic.info,
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local config = {
			virtual_text = false,
			signs = { active = signs },
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(config)

		-- Keybinds for available lsp server --
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		-- Global mappings
		keymap.set("n", "gs", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
		keymap.set("n", "gl", vim.diagnostic.open_float, opts) -- show diagnostics for line
		keymap.set("n", "gk", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
		keymap.set("n", "gj", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

		--Only map when lsp is attached
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

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

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()
		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- custom handler for specific servers
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
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
				})
			end,
			["pyright"] = function()
				lspconfig["pyright"].setup({
					capabilities = capabilities,
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
				})
			end,
		})
	end,
}
