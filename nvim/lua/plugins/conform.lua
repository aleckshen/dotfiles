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
					javascript = { "biome", "prettierd", stop_after_first = true },
					typescript = { "biome", "prettierd", stop_after_first = true },
					javascriptreact = { "biome", "prettierd", stop_after_first = true },
					typescriptreact = { "biome", "prettierd", stop_after_first = true },
					css = { "biome", "prettierd", stop_after_first = true },
					scss = { "prettierd" },
					html = { "prettierd" },
					yaml = { "prettierd" },
					markdown = { "prettierd" },
					vue = { "prettierd" },
					svelte = { "prettierd" },
					json = { "biome", "fixjson", stop_after_first = true },
					sh = { "shfmt" },
					go = { "gofumpt" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					cs = { "csharpier" },
				},
				formatters = {
					-- only use biome in projects that have a biome.json, otherwise fall back to prettierd
					biome = { require_cwd = true },
				},
			})
		end,
	},
}
