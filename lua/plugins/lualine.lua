return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "ayu_light", -- Light mode
                -- theme = "dracula", -- Dark mode
            },
        })
    end,
}
