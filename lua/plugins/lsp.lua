return {
    {
        "williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "pylsp", "bashls", "powershell_es", "phpactor" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.phpactor.setup({ capabilities = capabilities, root_dir = lspconfig.util.root_pattern('index.php') })

            vim.keymap.set("n", "ch", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "cd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "cr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, {})
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
        },
        config = function()
          require("refactoring").setup()
        end,
    },
}
