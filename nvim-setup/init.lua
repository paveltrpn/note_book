
-- ============================= ---
-- === Basic options section === ---
-- ============================= ---

vim.g.completeopt = "menu, preview"
       
-- Enable mouse. set mouse = - for disable
vim.opt.mouse = "a"
-- String numbers
vim.opt.number = true

vim.opt.shell = "bash"

-- Fix backspace indent
vim.opt.backspace = "indent,eol,start"

-- Hide tilde symbol that indicates empty lines in vim beffer.
-- It replace with blank space, in the end of next line space
-- symbol was next to backslash symbol
vim.opt.fillchars = "eob:\\"

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4

-- Syntax highlights
vim.opt.syntax = "on"
-- String numbers
vim.opt.number = true
-- Don't wrap string
vim.opt.wrap = false
-- Disable vim to create swapfile fo edited files
vim.opt.swapfile = false

vim.opt.autoindent = true

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"

vim.opt.expandtab = true
vim.opt.ruler = true

-- Useful to faster update gitgutter plugin show bar with changes
vim.opt.updatetime = 500

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.cmd([[
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
]])

--- NETRW file explorer settings (native vim file explorer)
--- call by :Explore command
vim.g.netrw_banner = 0
--- Tree instead a split view
vim.g.netrw_liststyle = 3
--- Open file in new tab
vim.g.netrw_browse_split = 3

-- Ask t oclose unsaved buffer instead of throw error
vim.opt.confirm = true

-- Show tabs as >---
-- vim.opt.list = true
-- vim.opt.listchars = {tab = ">-"}

-- Move newborn quickfix window to bottomest place.
-- This trigger takes advantage of the fact that the quickfix window 
-- can be easily distinguished by its file-type, qf. The wincmd J command 
-- is equivalent to the [Ctrl+W, Shift+J] shortcut sequence 
-- instructing Vim to move the current window to the very bottom of the screen
vim.cmd([[
:autocmd FileType qf wincmd J
]])

-- ======================= ---
-- === Keymaps section === ---
-- ======================= ---

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Highlight line under cursor
vim.o.cursorline = true
-- Toggle highlight line under cursor by <leader>h
map("n", "<Leader>h", ":set cursorline!<CR>")

-- Map to deselect word selected by shift-8 (or shift-*)
map("n", "<leader>8", ":nohlsearch<CR>")

-- Unmap F1 from normal and visual mode
vim.cmd([[
:map <F1> :echo<CR>
]])
-- Unmap F1 from insert mode (do no op)
vim.cmd([[
:imap <F1> <Nop>
]])
-- Map list all buffers command
vim.cmd([[
:noremap <F1> :ls<CR>
:noremap <F2> :bprev<CR>
:noremap <F3> :bnext<CR>
]])
-- Delete buffer (:bd) leader to avoid accident
vim.cmd([[
:noremap <leader><F4> :bd<CR>
:noremap <F4> :echo "to delete buffer use F4 with leader"<CR>
]])
-- More dangerous version of command above
--:noremap <leader><F4> :bd<CR>

-- Shortcuts to open vim explorer on far left pan
map("n", "<leader>ee", ":Lexplore %:p:h<CR>")
-- Close opened Explorer window
map("n", "<leader>eq", ":Lexplore<CR>")
-- Explorer pan size
vim.g.netrw_winsize = 20

-- Map to close quickfix window 
map("n", "<leader>qq", ":cclose<CR>")

-- Map to select quickfix window
map("n", "<leader>qs", ":copen<CR>")
-- Quickfix next and prev elements
map("n", "<leader>qn", ":cnext<CR>")
map("n", "<leader>qp", ":cprev<CR>")

--- ================================ ---
--- === Plugins fetching section === ---
--- ================================ ---

-- Uncomment next sentence if packer plugins fetch in 
-- seperate script, e.g. ~/.config/nvim/lua/plugins.lua
-- require("plugins")

local use = require('packer').use
require('packer').startup(function()
  -- Packer package manager
  use 'wbthomason/packer.nvim' 

  -- Color theme
  -- use 'folke/tokyonight.nvim'
  use 'sainnhe/sonokai'
  
  -- Status line written in lua
  use 'feline-nvim/feline.nvim'

  -- Plugin for autocomplete braces. This one works with LUA.
  use 'windwp/nvim-autopairs'
 
  -- Fuzzy finder plugin
  -- I use this instead of 'ibhagwan/fzf-lua'  
  -- despite of it's vim script plugin
  -- :FZF      - for fuzzy search
  -- :Rg <str> - for ripgrep
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
    
  -- Scroll by ctrl-f, ctrl-b, ctrl-e, ctrl-y, ctrl-u, ctrl-d
  use 'karb94/neoscroll.nvim'

  -- Github
  use 'lewis6991/gitsigns.nvim'

  -- Neovim tree-sitter support plugin
  use {
        'nvim-treesitter/nvim-treesitter',
         run = ':TSUpdate'
  }

  -- Powerful golang plugin written in vimsript
  use 'fatih/vim-go'
  
  -- Neovim built-in LSP support plugin
  use 'neovim/nvim-lspconfig'

  -- Autocomplition engine
  -- for work need do this:
  -- sudo apt-get install python3-venv
  -- :COQdeps
  use 'ms-jpq/coq_nvim'
  -- snippets
  use 'ms-jpq/coq.artifacts'

end)

-- ============================= ---
-- === Plugins setup section === ---
-- ============================= ---

-- use 'folke/tokyonight.nvim'
-- vim.g.tokyonight_italic_comments = false
-- vim.g.tokyonight_italic_keywords = false
-- vim.g.tokyonight_style = "night"
-- vim.cmd[[colorscheme tokyonight]]

-- use 'sainnhe/sonokai'
vim.opt.termguicolors = true
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1
vim.cmd([[colorscheme sonokai]])

-- use 'junegunn/fzf'
-- if file already opened, show it's buffer
vim.g.fzf_buffers_jump = 1 

-- use 'karb94/neoscroll.nvim'
require('neoscroll').setup()

-- use 'nvim-treesitter/nvim-treesitter'
-- ~/.config/nvim/lua/treesitter.lua
require "treesitter"

-- use 'ms-jpq/coq_nvim'
-- Config coq.nvim autostart
vim.cmd([[
let g:coq_settings = {'auto_start': 'shut-up'}
]])
-- Config to use with gopls
local lsp = require "lspconfig"
local coq = require "coq"
lsp.gopls.setup(coq.lsp_ensure_capabilities())

-- use 'lewis6991/gitsigns.nvim'
-- ~/.config/nvim/lua/gitsigns-nvim.lua
require "gitsigns-nvim"

-- use 'windwp/nvim-autopairs'
require("nvim-autopairs").setup{}

-- use 'feline-nvim/feline.nvim'
require("feline").setup()

-- use 'neovim/nvim-lspconfig'
-- mappings of LSP server if it included before them
--
-- ~/.config/nvim/lua/nvim-lspconfig.lua
require "nvim-lspconfig"

-- ~/.config/nvim/lua/vim-go.lua
require "vim-go"

