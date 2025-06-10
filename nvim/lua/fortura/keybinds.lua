local keymap = vim.keymap.set
local function bind(mode, keybnd, cmd, desc)
	keymap(mode, keybnd, cmd, { noremap = true, silent = true, desc = desc })
end

-- General
bind("n", "<leader>Q", "<CMD>q!<CR>", "Discard changes and quit")
bind("n", "<leader>q", "<CMD>q<CR>", "Quit")
bind("n", "<leader>w", "<CMD>w<CR>", "Write")
bind("n", "<leader>x", "<CMD>x<CR>", "Save and quit")

-- Highlighting
bind("n", "<Esc>", "<CMD>noh<CR>", "Clear search highlights")

-- Selection
bind("n", "<leader>a", "ggVG", "Select all")

-- Execution
bind("n", "<leader>X", ":.lua<CR>", "Run current line")
bind("v", "<leader>X", ":lua<CR>", "Run selected lines")

-- Buffers
bind("n", "<leader>bn", "<CMD>bnext<CR>", "Next buffer")
bind("n", "<leader>bp", "<CMD>bprevious<CR>", "Previous buffer")
bind("n", "<leader>bd", "<CMD>bdelete<CR>", "Delete buffer")

-- Split
bind("n", "<leader>sv", "<CMD>vsplit<CR>", "Vertical Split")
bind("n", "<leader>sh", "<CMD>split<CR>", "Horizontal Split")

-- Neotree
bind("n", "<leader>e", "<CMD>Neotree toggle<CR>", "Neo-tree toggle")

-- Oil
bind("n", "-", "<CMD>Oil --float<CR>", "Oil open parent directory")

-- Conform
bind("", "<leader>gf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, "Format Buffer")
