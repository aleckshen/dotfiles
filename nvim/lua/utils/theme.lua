local M = {}

-- names written by the `theme` script (~/dotfiles/bin/theme)
local colorschemes = {
	nord = "nord",
	rosepine = "rose-pine",
}

local function read_state(name)
	local path = vim.fs.joinpath(vim.env.XDG_STATE_HOME or vim.fs.normalize("~/.local/state"), name)
	local file = io.open(path)
	local value = file and file:read("*l")
	if file then
		file:close()
	end
	return value
end

-- written by the `trans` script (~/dotfiles/bin/trans); transparent unless it says "off"
M.transparent = function()
	return read_state("transparency") ~= "off"
end

-- colorscheme setups live here rather than in their plugin specs so `theme` and
-- `trans` can re-run them in open sessions
M.apply = function()
	local transparent = M.transparent()

	require("nord").setup({
		transparent = transparent,
		terminal_colors = true,
	})

	require("rose-pine").setup({
		variant = "main",
		styles = { transparency = transparent },
		-- diffs look like nord's (solid red/green fills via reverse), and diffview's
		-- file panel matches the rest of the editor
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
	})

	vim.cmd.colorscheme(colorschemes[read_state("theme")] or "nord")
end

return M
