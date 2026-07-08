return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("utils.diagnostics").setup()

		-- capabilities shared by every server (advertised to match nvim-cmp)
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- per-server overrides (settings/filetypes/cmd)
		require("servers")

		-- mason installs the servers; automatic_enable (default) calls
		-- vim.lsp.enable() for each installed server
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"dockerls",
				"emmet_ls",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"tailwindcss",
				"ts_ls",
			},
		})
	end,
}
