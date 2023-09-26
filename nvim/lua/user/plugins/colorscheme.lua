return {
-- Main
{ 
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require("tokyonight").setup({
            style = "night",
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
            }
        })

        vim.cmd([[colorscheme tokyonight]])
    end,
},

-- Others
{ 
    "sainnhe/sonokai",
    config = function()
        -- default, atlantis, anfromeda, shusia, maia, expresso
        vim.g.sonokai_style = "shusia"
    end
},
{ "ellisonleao/gruvbox.nvim" },

}




