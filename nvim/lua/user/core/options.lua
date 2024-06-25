-- basic --
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" -- allows nvim to access the os clipboard
vim.opt.mouse = "a" -- enabled mouse, "a" for all modes, and "niv" for normal, insert, visual mode
vim.opt.timeoutlen = 500 -- time in milliseconds to wait for a mapped sequence to complete
vim.opt.virtualedit = ""
vim.opt.iskeyword:append("-") -- consider string-string as whole word

-- backup --
vim.opt.swapfile = false
vim.opt.undofile = true -- enable persistent undo

-- line number and line column --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"

-- tab and indentation --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = false
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.smartindent = true -- make above smarter

-- wrap and scrolloff --
vim.opt.wrap = true -- line wrapping
vim.opt.scrolloff = 7 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 10

-- search --
vim.opt.hlsearch = false
vim.opt.incsearch = true -- search while typing a search command
vim.opt.smartcase = true -- if you type a capital letter, it will be case sensitive
-- vim.opt.ignorecase = true

-- splitting windows --
vim.opt.splitright = true -- split vertical widow to the right
vim.opt.splitbelow = true -- split horizontal widow to the below
vim.opt.equalalways = false -- don't resize windows when splitting

-- appearance --
vim.opt.showtabline = 2 -- always show tabline
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- with lualine, we don't need to show things like -- insert -- anymore

vim.cmd("autocmd bufenter * set formatoptions-=cro") -- disable auto-commenting new lines

vim.g.python3_host_prog = "/bin/python3"
