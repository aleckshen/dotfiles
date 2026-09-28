return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"cpp",
			"css",
			"dockerfile",
			"go",
			"graphql",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"svelte",
			"tsx",
			"typescript",
			"vue",
			"yaml",
		})
	end,
}
