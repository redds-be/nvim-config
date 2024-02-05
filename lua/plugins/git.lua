return {
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set("n", "gh", ":Gitsigns preview_hunk<CR>")
            vim.keymap.set("n", "gb", ":Gitsigns toggle_current_line_blame<CR>")
            vim.cmd(":Gitsigns toggle_current_line_blame")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "gg", ":LazyGit<CR>")
        end,
    },
}
