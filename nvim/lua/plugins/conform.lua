return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				format_on_save = { timeout_ms = 500, lsp_format = "fallback" },

				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescriptreact = { "prettierd" },
					css = { "prettierd" },
					scss = { "prettierd" },
					html = { "prettierd" },
					yaml = { "prettierd" },
					markdown = { "prettierd" },
					vue = { "prettierd" },
					svelte = { "prettierd" },
					json = { "fixjson" },
					sh = { "shfmt" },
					go = { "gofumpt" },
					c = { "clang-format" },
					cpp = { "clang-format" },
				},
			})
		end,
	},
}
