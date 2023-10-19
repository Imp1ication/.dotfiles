-- Shorten function name --
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Remap <Space> as leader key --
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Page up and down
keymap("n", "<C-u>", "15kzz", opts)
keymap("n", "<C-d>", "15jzz", opts)
keymap("n", "G", "ggzzzv", opts)
keymap("n", "gg", "Gzzzv", opts)

-- Keep cursor at the middle after search jumping
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Move in warpline
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "gj", "j", opts)
keymap("n", "gk", "k", opts)

-- Delete into void
keymap("n", "<leader>d", '"_d', opts)

-- Replace all
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<Cr>", opts)
keymap("n", "<C-Down>", ":resize -2<Cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<Cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<Cr>", opts)

-- Add empty line without get into Insert mode
keymap("n", "<Cr>", "o<Esc>k", opts)

-- Insert --
-- Press jj to exit insert mode
keymap("i", "jj", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep paste buffer after paste
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<Cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<Cr>gv=gv", opts)

-- NvimTree --
keymap("n", "<leader>e", ":NvimTreeToggle<Cr>", opts)

-- Buffer Line
keymap("n", "<leader>b", ":BufferLinePick<Cr>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<Cr>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<Cr>", opts)
keymap("n", "<leader>bh", ":BufferLineMovePrev<Cr>", opts)
keymap("n", "<leader>bl", ":BufferLineMoveNext<Cr>", opts)
keymap("n", "<leader>bd", ":bd<Cr>", opts)

-- Telescope --
keymap("n", "<leader>ff", ":Telescope find_files<Cr>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<Cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<Cr>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<Cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<Cr>", opts)
