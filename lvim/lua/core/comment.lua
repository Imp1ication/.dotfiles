lvim.builtin.comment = {
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        line = "gcc",
        block = "gbc",
    },

    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = "gc",
        block = "gb",
    },

    ---LHS of extra mappings
    extra = {
        above = "gcO",
        below = "gco",
        eol = "gca",
    },

    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
}
