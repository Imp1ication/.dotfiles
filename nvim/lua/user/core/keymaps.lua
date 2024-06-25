-- Set Leader key to Spaace --
vim.g.mapleader = " "

-- Shorten function name --
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal --
-- Page up and down
keymap("n", "<C-u>", "15kztzv", opts)
keymap("n", "<C-d>", "15jztzv", opts)
keymap("n", "G", "Gzzzv", opts)
keymap("n", "gg", "ggzzzv", opts)

-- Keep cursor at the middle after search jumping
keymap("n", "n", "nztzv", opts)
keymap("n", "N", "Nztzv", opts)

-- Move in warpline
keymap({ "n", "v" }, "j", "gj", opts)
keymap({ "n", "v" }, "k", "gk", opts)
keymap({ "n", "v" }, "gj", "j", opts)
keymap({ "n", "v" }, "gk", "k", opts)

-- Add empty line without get into Insert mode
keymap("n", "<CR>", "o<Esc>k", opts)

-- Delete into void
keymap({ "n", "v" }, "<leader>d", '"_d', opts)

-- Replace all
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jj to exit insert mode
keymap("i", "jj", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep paste buffer after paste
keymap("v", "p", '"_dP', opts)
keymap("v", "<leader>p", "p", opts)

-- Buffer Line
keymap("n", "<leader>b", ":BufferLinePick<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>zz", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>zz", opts)
keymap("n", "<leader>bh", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>bl", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)

-- ChatGPT
keymap("v", "<leader>cg", ":ChatGPTEditWithInstruction<CR>", opts)
