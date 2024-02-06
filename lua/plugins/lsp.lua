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
                ensure_installed = { "lua_ls", "gopls", "pylsp", "rust_analyzer" },
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
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })

            vim.keymap.set("n", "ch", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "cd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "cr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, {})
        end,
    },
}
