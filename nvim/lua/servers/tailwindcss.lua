return function(capabilities)
	vim.lsp.config("tailwindcss", {
		capabilities = capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
		},
	})
end
