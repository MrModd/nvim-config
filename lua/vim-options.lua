vim.cmd("set encoding=utf-8")
-- Line numbers
vim.cmd("set ruler")
vim.cmd("set number")
-- Use more prompt when listing options that takes the full screen
vim.cmd("set more")
-- Watch for file changes
vim.cmd("set autoread")
-- ???
vim.cmd("set hidden")
-- Automatically write when changing buffer
vim.cmd("set autowrite")
-- Don't redraw when no need to
vim.cmd("set lazyredraw")
-- Show the current mode and vim command below in the screen
vim.cmd("set showmode")
vim.cmd("set showcmd")
-- Vim, not vi
vim.cmd("set nocompatible")
-- Indentation
vim.cmd("set autoindent smartindent")
vim.cmd("set smarttab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
-- Increase history of last commands
vim.cmd("set history=200")
-- Increase undo buffer
vim.cmd("set undolevels=1000")
vim.cmd("set updatecount=100")
-- Allow backspace to delete indent, end of lines and start of insert
vim.cmd("set backspace=indent,eol,start")
-- Break too long lines on end of words characters
vim.cmd("set linebreak")
-- Don't wrap lines when they are too long (makes previous command useless)
vim.cmd("set nowrap")
-- Use 2 lines for the vim commands at the bottom of the screen
vim.cmd("set cmdheight=2")
-- Open the new splts on the right and below
vim.cmd("set splitbelow")
vim.cmd("set splitright")
-- Be smart when searching in the file
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
-- Fold blocks delimited by {{{ and }}}
vim.cmd("set foldmethod=marker")
-- Allow usage of the mouse
vim.cmd("set mouse=a")
-- Use the system clipboard as buffer for yank (on ssh it requires X forwarding)
vim.cmd("set clipboard=unnamedplus")
-- Invisible characters configurations (eg. trailing spaces and tabs)
-- vim equivalent: set listchars=tab:▸\ ,eol:¬,trail:·
vim.opt.listchars = {tab = "▸ ", eol = "¬", trail = "·"}
vim.cmd("set list")
-- Set leader character (used in some keybindings)
vim.g.mapleader = " "
-- Reduce update time to 100ms to be more reactive
vim.cmd("set updatetime=100")

-------------------------
-- General keybindings --
-------------------------

vim.keymap.set("n", "<F3>", "<Cmd>set list!<CR><Cmd>set number!<CR>", { desc = "Generic: show/hide invisible characters" })
vim.keymap.set("n", "<F4>", "aBasito<ESC>", { desc = "Generic: effequattro, basito" })
vim.keymap.set("n", "<F6>", "<C-w>T", { desc = "Generic: move one window of the split to a new tab" })
vim.keymap.set("n", "<C-t>", "<Cmd>tabnew<CR>", { desc = "Generic: ppen a new tab" })
vim.keymap.set("n", "<C-Left>", "gT", { desc = "Generic: go to tab on the left" })
vim.keymap.set("n", "<C-Right>", "gt", { desc = "Generic: go to tab on the right" })
vim.keymap.set("n", "<C-o>", "<Cmd>pop<CR>", { desc = "Generic: come back from tag" })
