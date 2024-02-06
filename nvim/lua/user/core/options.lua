local options = {
	fileencoding = "utf-8", -- encoding
	clipboard = "unnamedplus", -- allows nvim to access the OS clipboard
	-- mouse = "a", -- enabled mouse
	timeoutlen = 500,
	updatetime = 500,
	conceallevel = 0, -- make `` visible in markdown files

	-- backup --
	backup = false,
	swapfile = false,
	undofile = true, -- enable persistent undo

	-- line number and line column --
	number = true,
	relativenumber = true,
	numberwidth = 4, -- set number column width to 4
	signcolumn = "yes",

	-- tab and indentation --
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true, -- expand tab to spaces
	autoindent = true, -- copy indent from current line when starting a new line
	smartindent = true, -- make above smarter

	-- wrap and scrolloff
	wrap = true, -- disable line wrapping
	scrolloff = 4, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8,

	-- search --
	hlsearch = false,
	incsearch = true, -- search while typing a search command
	smartcase = true,
	-- ignorecase = true,       -- if you don't like smartcase, you can just instead it with this option

	-- appearance --
	showtabline = 2, -- always show tabs
	cursorline = true,
	cmdheight = 1,
	pumheight = 10, -- pop up menu heaght
	showmode = false, -- with powerline, we don't need to show things like -- INSERT -- anymore
	-- laststatus = 2,          -- allways show status line
	splitbelow = true, -- split horizontal widow to the below
	splitright = true, -- split vertical widow to the right
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.iskeyword:append("-") -- consider string-string as whole word
vim.cmd("autocmd BufEnter * set formatoptions-=cro")

vim.g.python3_host_prog = "/bin/python3"
vim.g.ruby_host_prog = "/usr/local/bin/neovim-ruby-host"

vim.g.mkdp_theme = "dark"
