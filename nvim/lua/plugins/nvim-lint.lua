return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")

			local luacheck = require("lint").linters.luacheck
			luacheck.args = vim.list_extend(
				{ "--globals", "vim", "--" },
				luacheck.args or {}
			)

			lint.linters_by_ft = {
				lua = { "luacheck" },
				python = { "ruff" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				json = { "eslint_d" },
				sh = { "shellcheck" },
				go = { "revive" },
				dockerfile = { "hadolint" },
				c = { "clangtidy" },
				cpp = { "clangtidy" },
			}

			local eslint_fts = { javascript = true, typescript = true, javascriptreact = true, typescriptreact = true, json = true }

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
				callback = function()
					local ft = vim.bo.filetype
					if eslint_fts[ft] then
						if vim.fn.executable("eslint_d") == 0 then
							return
						end
						local config = vim.fs.find({
							".eslintrc", ".eslintrc.js", ".eslintrc.cjs",
							".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json",
							"eslint.config.js", "eslint.config.mjs", "eslint.config.cjs",
						}, { path = vim.api.nvim_buf_get_name(0), upward = true })[1]
						if not config then
							return
						end
					end
					local linters = lint.linters_by_ft[ft] or {}
					for _, linter in ipairs(linters) do
						if vim.fn.executable(linter) == 1 then
							lint.try_lint(linter)
						end
					end
				end,
			})
		end,
	},
}
