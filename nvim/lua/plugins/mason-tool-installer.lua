return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- formatters (conform.nvim)
				"prettierd",
				"stylua",
				"black",
				"isort",
				"fixjson",
				"shfmt",
				"gofumpt",
				"clang-format",
				-- linters (nvim-lint)
				"eslint_d",
				"ruff",
				"luacheck",
				"shellcheck",
				"hadolint",
				"revive",
			},
		})
	end,
}
