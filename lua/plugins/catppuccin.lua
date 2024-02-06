return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({ flavour = "latte" }) -- Light mode
        -- require("catppuccin").setup() -- Dark mode
		vim.cmd.colorscheme("catppuccin")
	end,
}
