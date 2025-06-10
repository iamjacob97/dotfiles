local option = vim.opt
-- General
option.encoding = "utf-8"
option.fileencoding = "utf-8"
option.termguicolors = true
option.mouse = "a"

-- UI
option.number = true
option.relativenumber = true
option.showmode = false
option.signcolumn = "yes"
option.cursorline = true
option.scrolloff = 3
option.confirm = true

-- Clipboard
vim.schedule(function()
	option.clipboard = "unnamedplus"
end)

-- Tabs & Indentation
option.expandtab = true
option.tabstop = 2
option.shiftwidth = 2
option.softtabstop = 2
option.autoindent = true
option.breakindent = true

-- Edit
option.virtualedit = "block"

-- Search
option.ignorecase = true
option.smartcase = true

-- Split
option.splitright = true
option.splitbelow = true

-- Undo
option.undofile = true
