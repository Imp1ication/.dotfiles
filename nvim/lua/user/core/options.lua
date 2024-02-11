local options = {
	fileencoding = "utf-8",
	clipboard = "unnamedplus", -- allows nvim to access the OS clipboard
	mouse = "a", -- enabled mouse
	timeoutlen = 500, -- Time in milliseconds to wait for a mapped sequence to complete
	termguicolors = true,
	virtualedit = "block",

	-- backup --
	swapfile = false,
	undofile = true, -- enable persistent undo

	-- line number and line column --
	number = true,
	relativenumber = true,
	numberwidth = 2,
	signcolumn = "auto",

	-- tab and indentation --
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true, -- expand tab to spaces
	autoindent = true, -- copy indent from current line when starting a new line
	smartindent = true, -- make above smarter

	-- wrap and scrolloff
	wrap = false, -- line wrapping
	scrolloff = 4, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8,

	-- search --
	hlsearch = false,
	incsearch = true, -- search while typing a search command
	smartcase = true,
	-- ignorecase = true, -- if you don't like smartcase, you can just instead it with this option

	-- window --
	splitbelow = true, -- split horizontal widow to the below
	splitright = true, -- split vertical widow to the right
	equalalways = false, -- don't resize windows when splitting

	-- appearance --
	showtabline = 2, -- always show tabline
	cursorline = true,
	cmdheight = 1,
	pumheight = 10, -- pop up menu heaght
	showmode = false, -- with lualine, we don't need to show things like -- INSERT -- anymore
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.iskeyword:append("-") -- consider string-string as whole word
vim.cmd("autocmd BufEnter * set formatoptions-=cro") -- Disable auto-commenting new lines

vim.g.python3_host_prog = "/bin/python3"
vim.g.ruby_host_prog = "/usr/local/bin/neovim-ruby-host"
