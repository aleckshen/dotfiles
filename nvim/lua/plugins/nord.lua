return {
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				-- optional settings
				transparent = true,
				terminal_colors = true,
			})

			vim.cmd.colorscheme("nord")
		end,
	},
}
