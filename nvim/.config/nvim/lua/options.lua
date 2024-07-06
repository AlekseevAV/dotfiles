vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.colorcolumn = "119"
opt.so = 10
opt.timeoutlen = 100

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true
opt.smartcase = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- set conceal level for obsidian plugin
opt.conceallevel = 2

-- set python provider
vim.g.python3_host_prog = "~/.pyenv/versions/3.11.4/envs/pynvim/bin/python"
