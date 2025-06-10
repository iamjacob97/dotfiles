return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"python",
				"c",
				"cpp",
				"java",
				"kotlin",
				"go",
				"rust",
				"zig",
				"haskell",
				"html",
				"css",
				"angular",
				"php",
				"javascript",
				"typescript",
				"sql",
				"graphql",
				"diff",
				"dockerfile",
				"git_config",
				"gitignore",
				"bash",
				"tmux",
				"csv",
				"json",
				"toml",
				"xml",
				"yaml",
				"latex",
				"query",
				"regex",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
			},
			auto_install = false,
			highlight = {
				enable = true,
				-- disable = function(lang, buf)
				-- 	local max_filesize = 159 * 1024
				-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				-- 	if ok and stats and stats.size > max_filesize then
				-- 		return true
				-- 	end
				-- end,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ns",
					node_incremental = "<leader>ni",
					scope_incremental = "<leader>nu",
					node_decremental = "<leader>nd",
				},
			},
		})
	end,
}
