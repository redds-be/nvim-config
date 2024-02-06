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
				null_ls.builtins.formatting.rustfmt.with({
					extra_args = function(params)
						local Path = require("plenary.path")
						local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

						if cargo_toml:exists() and cargo_toml:is_file() then
							for _, line in ipairs(cargo_toml:readlines()) do
								local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
								if edition then
									return { "--edition=" .. edition }
								end
							end
						end
						-- default edition when we don't find `Cargo.toml` or the `edition` in it.
						return { "--edition=2023" }
					end,
				}),
			},
		})

		vim.keymap.set("n", "cf", vim.lsp.buf.format, {})
	end,
}
