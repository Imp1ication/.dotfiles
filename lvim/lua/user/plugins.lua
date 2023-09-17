lvim.plugins = {
    -- Colorscheme
    { "sainnhe/sonokai" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },

    -- Rainbow parentheses
    { "mrjones2014/nvim-ts-rainbow" },

    -- Context
    {"nvim-treesitter/nvim-treesitter-context"},

    -- Copilot
    -- { "zbirenbaum/copilot.lua" },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}

-- Colorscheme
vim.o.background = "dark"

vim.g.sonokai_style = "shusia"
lvim.colorscheme = "tokyonight-night"

-- Rainbow parentheses
lvim.builtin.treesitter.rainbow.enable = true
