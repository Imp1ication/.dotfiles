return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Completion
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		-- Snippets
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local styles = require("user.core.styles")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		-- Config --
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-a>"] = cmp.mapping.abort(),

				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- Super Tab
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},

			formatting = {
				expandable_indicator = true,
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					-- kind icons
					vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
					vim_item.kind = string.format("%s %s", styles.kind_icons[vim_item.kind], vim_item.kind)

					-- menu
					vim_item.menu = ({
						copilot = "(copilot)",
						nvim_lsp = "(lsp)",
						luasnip = "(snippet)",
						buffer = "(buffer)",
						path = "(path)",
					})[entry.source.name]

					return vim_item
				end,
			},
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				completion = {
					border = styles.border_style["round"],
					scrollbar = false,
				},
				documentation = {
					border = styles.border_style["round"],
					scrollbar = true,
				},
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})
	end,
}
