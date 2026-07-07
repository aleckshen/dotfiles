vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "strict",
				autoSearchPaths = true,
				diagnosticMode = "workspace",
			},
		},
	},
})
