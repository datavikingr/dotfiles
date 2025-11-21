-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>ff", vim.cmd.Ex) -- file explorer
vim.keymap.set("x", "<leader>p", "\"_dP") -- keeps original copy material in pastebuffer after highlight and paste-over
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


-- Basic Settings & Behavior
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.signcolumn = "yes" -- git/lsp gutter
vim.opt.cursorline = true --highlight the current line
vim.opt.wrap = false -- no line wrapping
vim.opt.scrolloff = 10 -- keep 10 lines during vertical scrolling
vim.opt.sidescrolloff = 10 -- keep 10 lines during horizontal scrolling
vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no bells
vim.opt.backspace = "indent,eol,start" -- better backspace
vim.opt.autochdir = false -- don't change dir
vim.opt.iskeyword:append("-") -- dashes can be part of a word in search
vim.opt.path:append("**") -- include subfolders in search
vim.opt.mouse = "a" -- enable proper mouse support
vim.opt.whichwrap = "h,l,<,>,[,]" -- normalized arrow movement
vim.opt.clipboard:append("unnamedplus") -- use system clipboard buffer

-- Indent
vim.opt.tabstop =4 -- tabs = 4 spaces
vim.opt.softtabstop = 4  -- tabs = 4 spaces
vim.opt.shiftwidth = 4 -- tabs = 4 spaces
vim.opt.expandtab = false -- use tabs instead of spaces
vim.opt.smartindent = true -- smart auto-indenting
vim.opt.autoindent = true -- copy indent from current line
vim.opt.copyindent = true -- copy indent from paste
vim.preserveindent = true -- try to preserve indentation

-- Backups & Undos
vim.opt.autoread = true -- autoreload files changed outside nvim
vim.opt.autowrite = false -- don't autosave
vim.opt.backup = false -- no backups
vim.opt.writebackup = false -- no backups
vim.opt.swapfile = false -- no backups
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir" -- persistent undo file directory
vim.opt.undofile = true -- use undo file

-- Search & Autocomplete Features
vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = true -- incremental search
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in search
vim.opt.completeopt = "menuone,noinsert,noselect" --completion options

-- Speed
vim.opt.updatetime = 50 -- fast
vim.opt.lazyredraw = true -- don't redraw during macros

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {'nvim-telescope/telescope.nvim', tag = 'v0.1.9', dependencies = { 'nvim-lua/plenary.nvim' } }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Theme & BG Transparency
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "Normal", { bg = "none"}) -- transparent bg
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none"}) -- transparent bg
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none"}) -- transparent bg
vim.opt.termguicolors = true -- 24-bit colors
vim.opt.winblend = 0 -- transparent pop up windows
vim.opt.encoding = "UTF-8" -- set encoding to 'normal'

-- Telescope (reqs ripgrep)

return { 'nvim-telescope/telescope.nvim', tag = 'v0.1.9', dependencies = { 'nvim-lua/plenary.nvim' } }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
