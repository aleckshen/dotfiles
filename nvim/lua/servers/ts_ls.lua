vim.lsp.config("ts_ls", {
	filetypes = {
		"typescript",
		"javascript",
		"typescriptreact",
		"javascriptreact",
	},
	settings = {
		typescript = {
			indentStyle = "space",
			indentSize = 2,
		},
	},
})
