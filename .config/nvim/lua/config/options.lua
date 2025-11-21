-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

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
vim.opt.tabstop = 4 -- tabs = 4 spaces
vim.opt.softtabstop = 4 -- tabs = 4 spaces
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
vim.opt.lazyredraw = false -- don't redraw during macros
