return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_gut_status = true,
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
                    hide_gitignored = false,
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
		--vim.cmd(":Neotree filesystem reveal left") -- launch at startup
	end,
}
