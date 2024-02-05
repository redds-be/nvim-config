return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"c",
				"go",
				"gomod",
				"gosum",
				"python",
				"vim",
				"html",
				"css",
				"javascript",
				"sql",
				"bash",
				"markdown",
				"markdown_inline",
				"make",
				"json",
				"yaml",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
