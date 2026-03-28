-----------------------------------------------------------
-- Autostart behavior
-----------------------------------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.schedule(function()
      vim.cmd("NvimTreeOpen")
      vim.cmd("wincmd p")
      vim.cmd("startinsert")
    end)
  end,
})

-----------------------------------------------------------
-- Options
-----------------------------------------------------------
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.o.guicursor = "a:ver100"

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
local terminal_buf = nil
local terminal_win = nil
local function toggle_terminal()
  -- If terminal window exists and is valid → close it
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end
  -- Otherwise open (or reuse) terminal buffer
  vim.cmd("belowright split")
  vim.cmd("resize 5")
  terminal_win = vim.api.nvim_get_current_win()
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_set_current_buf(terminal_buf)
  else
    vim.cmd("lcd " .. vim.fn.getcwd())
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
  end
  vim.cmd("startinsert")
end

-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
local all_modes = { "n", "i", "v" }
local normal_visual = { "n", "v" }

-- Toggle insert/normal
vim.keymap.set({ "i", "n" }, "<Esc>", function()
  if vim.api.nvim_get_mode().mode == "i" then
    vim.cmd("stopinsert")
  else
    vim.cmd("startinsert")
  end
end)

-- Toggle terminal mode
vim.keymap.set({ "n", "i", "t" }, "<C-t>", toggle_terminal, { desc = "Toggle terminal" })

-- Movement remaps
vim.keymap.set(normal_visual, "<Up>", "k")
vim.keymap.set(normal_visual, "<Down>", "j")
vim.keymap.set(normal_visual, "<Left>", "h")
vim.keymap.set(normal_visual, "<Right>", "l")


-- Quit
vim.keymap.set(all_modes, "<C-q>", "<cmd>qall!<cr>")

-- Save
vim.keymap.set(all_modes, "<C-s>", "<cmd>w<cr>")

-- Copy
vim.keymap.set(normal_visual,  "<C-c>", '"+y<esc>')
vim.keymap.set("i", "<C-c>", function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == "v" or mode == "V" then
    vim.cmd('normal! "+y')
    vim.cmd('stopinsert')
    vim.cmd('startinsert')
  end
end)

-- Paste
vim.keymap.set(normal_visual, "<C-v>", '"+p') --normal/visual mode
vim.keymap.set("i", "<C-v>", "<C-r>+") -- insert mode, inline paste

-- Cut
vim.keymap.set(normal_visual,  "<C-x>", '"+d<esc>')

-- Backspace in Visual Mode (mouse selection)
vim.keymap.set("v", "<BS>", "d")

-- Undo / Redo
vim.keymap.set(all_modes, "<C-z>", "u")
vim.keymap.set(all_modes, "<C-y>", "<C-r>")

-- New file
vim.keymap.set(all_modes, "<C-n>", "<cmd>enew<cr>")

--Find / File picker
vim.keymap.set(all_modes, "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set(all_modes, "<C-p>", "<cmd>Telescope find_files<cr>")

-- Toggle sidebar
vim.keymap.set(all_modes, "<C-b>", "<cmd>NvimTreeToggle<cr>")

-----------------------------------------------------------
-- lazy.nvim bootstrap
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
----- Plugins
--------------------------------------------------------------
require("lazy").setup({

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- make sure it loads first
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
      vim.cmd.colorscheme("catppuccin")
      -- Force transparency (covers edge cases)
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    end,
  },  

-- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        update_focused_file = { enable = true },
        sync_root_with_cwd = true,
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- LSP
  { "neovim/nvim-lspconfig" },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
  },

  -- Breadcrumbs
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
  },

  -- Statusline
  { "nvim-lualine/lualine.nvim" },
})

-----------------------------------------------------------
-- LSP setup
-----------------------------------------------------------
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("nvim-navic")

local servers = {
  lua_ls = {},
  pyright = {},
  ts_ls = {},
  clangd = {},
  gopls = {},
  rust_analyzer = {},
}

-- Register server configs
for server, config in pairs(servers) do
  vim.lsp.config(server, vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
    end,
  }, config))
end

-- Enable servers
vim.lsp.enable(vim.tbl_keys(servers))

-----------------------------------------------------------
-- Autocomplete
-----------------------------------------------------------
local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})

-----------------------------------------------------------
-- Statusline
-----------------------------------------------------------
require("lualine").setup({
  sections = {
    lualine_c = {
      { "filename", path = 1 },
      {
        function()
          return navic.is_available() and navic.get_location() or ""
        end,
        cond = navic.is_available,
      },
    },
  },
})
