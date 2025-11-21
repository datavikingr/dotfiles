-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- vim.keymap.set("n", "<leader>ff", vim.cmd.Ex) -- file explorer
vim.keymap.set("x", "<leader>p", '"_dP') -- keeps original copy material in pastebuffer after highlight and paste-over
vim.keymap.set("n", "<leader>so", vim.cmd.so) -- reload the file you're working on
vim.keymap.set("n", "<BS>", "X", { desc = "Backspace in Normal Mode" })
vim.keymap.set("n", "<Del>", "x", { desc = "Delete in Normal Mode" })
-- i/a enters edit mode
-- Esc returns to view mode
-- v enters text selection mode

-- Save
vim.keymap.set({ "i", "n", "v" }, "<C-s>", vim.cmd.write, { desc = "Save File" })

--Save As
vim.keymap.set({ "i", "n", "v" }, "<C-S-s>", ":saveas ", { desc = "Save as..." })

-- Copy
vim.keymap.set({ "i" }, "<C-c>", '<Esc>"+yyi', { desc = "Copy line (Insert)" })
vim.keymap.set({ "n" }, "<C-c>", '"+yy', { desc = "Copy line (Normal)" })
vim.keymap.set({ "v" }, "<C-c>", '"+y', { desc = "Copy selection (Visual)" })

-- Paste
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { desc = "Paste after cursor (Insert)" })
vim.keymap.set("v", "<C-v>", '"+p', { desc = "Paste over selection (Visual)" })
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste (Normal)" })

-- Cut
vim.keymap.set("i", "<C-x>", '<Esc>"+ddi', { desc = "Cut line (Insert)" })
vim.keymap.set("n", "<C-x>", '"+dd', { desc = "Cut line (Normal)" })
vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cut selection (Visual)" })

-- Undo/Redo
vim.keymap.set({ "i", "n", "v" }, "<C-z>", "<Undo>", { desc = "Undo" })
vim.keymap.set({ "i", "n", "v" }, "<C-Z>", "<Redo>", { desc = "Redo" })

-- Select All
vim.keymap.set({ "n", "i", "v" }, "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- Move cursor to top or bottom of file
vim.keymap.set("i", "<C-Home>", "<Esc>ggi", { desc = "Go to top of file" })
vim.keymap.set("i", "<C-End>", "<Esc>G$i", { desc = "Go to bottom of file" })

-- Moving whole lines
vim.keymap.set({ "n", "i" }, "<A-down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set({ "n", "i" }, "<A-up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })

-- Duplicate line
vim.keymap.set({ "n", "i" }, "<C-d>", "<Esc>yypi", { desc = "Duplicate line" })

-- Delete line
vim.keymap.set({ "n", "i" }, "<C-S-k>", "<Esc>ddi", { desc = "Delete line" })

-- Find
vim.keymap.set({ "n", "i", "v" }, "<C-f>", "/", { desc = "Search" })

-- Find & Replace
vim.keymap.set({ "n", "i", "v" }, "<C-h>", ":%s/", { desc = "Replace in file" })
