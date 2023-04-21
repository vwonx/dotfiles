-- UTF-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- jkhl padding
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- use relative line number
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight current row /column
vim.wo.cursorline = true
vim.wo.cursorcolumn = false

-- left sign column
vim.wo.signcolumn = "yes"

-- editor rulers
vim.wo.colorcolumn = "120"

-- 4 spaces = 1 tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- move 4 spaces when use ">>" and "<<"
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- use space instead of tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- copy indent from current line when starting a new line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- ignore case except uppercase when search text
vim.o.ignorecase = true
vim.o.smartcase = true

-- search hight
vim.opt.hlsearch = false
vim.o.incsearch = true

-- command line height
vim.o.cmdheight = 1

-- auto load when file changed
vim.o.autoread = true
vim.bo.autoread = true

-- no wrap for code
vim.wo.wrap = false

-- when at the head/tail of the line, j and k can move to the upper and lower lines
vim.o.whichwrap = "<,>,[,]"

-- allow hidden buffer
vim.o.hidden = true

-- disable create backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime
vim.o.updatetime = 500

-- Time in milliseconds to wait for a mapped sequence to complete.
vim.o.timeoutlen = 500

-- split window right and below
vim.o.splitbelow = true
vim.o.splitright = true

-- true color
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- invisible chars display
vim.o.list = true
vim.o.listchars = "space:·"

-- cmp
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- command-line completion is enhanced
vim.o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"

-- popup menu 10 items in max
vim.o.pumheight = 10

-- always display tabline
vim.o.showtabline = 2

-- disable show mode, use lualine plugin instead
vim.o.showmode = false

-- system clipboard
vim.opt.clipboard = "unnamedplus"

-- disable netrw at the very start of your init.lua (strongly advised) nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
