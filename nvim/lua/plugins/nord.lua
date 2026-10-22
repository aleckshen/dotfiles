return {
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- setup() and the colorscheme itself are handled by utils.theme
			-- nord.nvim's transparent option skips floating windows,
			-- notifications, and the cmp completion popup (Pmenu - nvim-cmp's
			-- default winhighlight points both the popup body and its border
			-- at Pmenu) since they're wired to a bg that ignores it upstream,
			-- so clear those backgrounds by hand. nvim_set_hl replaces the
			-- whole definition rather than merging, so read the existing one
			-- first or this wipes fg (and border glyphs render colourless).
			-- PmenuSel is left alone so the selected entry stays visible.
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "nord",
				callback = function()
					if not require("utils.theme").transparent() then
						return
					end
					for _, group in ipairs({ "NormalFloat", "FloatBorder", "FloatTitle", "NotifyBackground", "Pmenu" }) do
						local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
						hl.bg = nil
						vim.api.nvim_set_hl(0, group, hl)
					end
				end,
			})
		end,
	},
}
