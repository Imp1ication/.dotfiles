lvim.leader = "space"

 lvim.keys.insert_mode = {
    ["jj"] = "<Esc>",

	-- Move current line / block with Alt-j/k.
	-- ["<A-j>"] = false,
    -- ["<A-k>"] = false,
}

lvim.keys.normal_mode = {
    -- Page up and down
    ["<C-u>"] = "20kzt",
    ["<C-d>"] = "20jzt",
    ["G"] = "Gzz",

    -- Keep cursor at the middle after search jumping
    ["n"] = "nzz",
    ["N"] = "Nzz",

    -- Delete into void
    ["<leader>d"] = "\"_d",

    -- Add empty line without get into insert mode
    ["<Cr>"] = "o<Esc>k",

    -- Search mark
    ["/"] = "ms/",

	-- -- Better window movement
	-- ["<C-h>"] = false,
	-- ["<C-j>"] = false,
	-- ["<C-k>"] = false,
	-- ["<C-l>"] = false,

	-- -- Resize with arrows
	-- ["<C-Up>"] = false,
	-- ["<C-Down>"] = false,
	-- ["<C-Left>"] = false,
	-- ["<C-Right>"] = false,

	-- BufferLine
    ["<leader>b"] = ":BufferLinePick<Cr>",
    ["<leader>bh"] = ":BufferLineMovePrev<Cr>",
    ["<leader>bl"] = ":BufferLineMoveNext<Cr>",
    ["<leader>bd"] = ":BufferKill<Cr>",

	["<S-h>"] = ":BufferLineCyclePrev<Cr>",
	["<S-l>"] = ":BufferLineCycleNext<Cr>",

    -- Telescope
    ["<leader>f"] = false,
    ["<leader>ff"] = ":Telescope find_files<Cr>",
    ["<leader>fo"] = ":Telescope oldfiles<Cr>",
    ["<leader>fg"] = ":Telescope live_grep<Cr>",

    -- Diagnostic
    ["gk"] = ":lua vim.diagnostic.goto_prev()<Cr>zt",
    ["gj"] = ":lua vim.diagnostic.goto_next()<Cr>zt",
    ["gl"] = ":lua vim.diagnostic.open_float()<Cr>",

    -- Lsp
    ["<leader>fm"] = ":lua vim.lsp.buf.format()<Cr>",
    ["<leader>rn"] = ":lua vim.lsp.buf.rename()<Cr>",
    ["gd"] = ":lua vim.lsp.buf.definition()<Cr>",
    ["gD"] = ":lua vim.lsp.buf.declaration()<Cr>",
    ["ga"] = ":lua vim.lsp.buf.code_action()<Cr>",
    ["gI"] = ":lua vim.lsp.buf.implementation()<Cr>",
    ["gr"] = ":lua vim.lsp.buf.references()<Cr>",
    ["K"] = ":lua vim.lsp.buf.hover()<Cr>",
    ["gs"] = ":lua vim.lsp.buf.signature_help()<Cr>",

	-- Move current line / block with Alt-j/k.
	-- ["<A-j>"] = false,
	-- ["<A-k>"] = false,

	-- -- QuickFix
	-- ["]q"] = false,
	-- ["[q"] = false,
	-- ["<C-q>"] = false,
}

lvim.keys.visual_mode = {
    -- -- Better indenting
    -- ["<"] = false,
    -- [">"] = false,

    -- Keep paste buffer after paste
	["p"] = '"0p',
	["P"] = '"0P',
}

lvim.keys.term_mode = {
	-- -- Terminal window navigation
	-- ["<C-h>"] = false,
	-- ["<C-j>"] = false,
	-- ["<C-k>"] = false,
	-- ["<C-l>"] = false,
}

lvim.keys.visual_block_mode = {
	-- -- Move selected line / block of text in visual mode
	-- ["K"] = false,
	-- ["J"] = false,

	-- -- Move current line / block with Alt-j/k.
	-- ["<A-j>"] = false,
	-- ["<A-k>"] = false,
}

lvim.keys.command_mode = {
	-- -- navigate tab completion with <c-j> and <c-k>
	-- -- runs conditionally
	-- ["<C-j>"] = false,
	-- ["<C-k>"] = false,
}

-- lvim.builtin.terminal.open_mapping = "<C-\\"
