return {
	"nvimtools/none-ls.nvim",
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.shellharden,
                null_ls.builtins.formatting.phpcsfixer,
                null_ls.builtins.diagnostics.phpcs,
			},
		})

		vim.keymap.set("n", "cf", vim.lsp.buf.format, {})
	end,
}
