return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "main",
			styles = { transparency = true },
			-- diffs look like nord's (solid red/green fills via reverse), and diffview's
			-- file panel stays transparent like the rest of the editor
			highlight_groups = {
				DiffAdd = { fg = "#A3BE8C", bg = "#3B4252", reverse = true, inherit = false },
				DiffDelete = { fg = "#BF616A", bg = "#3B4252", reverse = true, inherit = false },
				DiffChange = { fg = "#EBCB8B", bg = "#3B4252", reverse = true, inherit = false },
				DiffText = { fg = "#81A1C1", bg = "#3B4252", reverse = true, inherit = false },
				DiffviewFilePanelInsertions = { fg = "#A3BE8C" },
				DiffviewFilePanelDeletions = { fg = "#BF616A" },
				DiffviewNormal = { link = "Normal" },
				DiffviewWinSeparator = { link = "WinSeparator" },
			},
		},
	},
}
