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
			-- nord.nvim's transparent option skips floating windows and
			-- notifications (they're wired to a bg that ignores it upstream),
			-- so clear those backgrounds by hand.
			for _, group in ipairs({ "NormalFloat", "FloatBorder", "FloatTitle", "NotifyBackground" }) do
				vim.api.nvim_set_hl(0, group, { bg = "none" })
			end
		end,
	},
}
