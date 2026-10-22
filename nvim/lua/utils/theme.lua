local M = {}

-- names written by the `theme` script (~/dotfiles/bin/theme)
local colorschemes = {
	nord = "nord",
	rosepine = "rose-pine",
}

M.apply = function()
	local state = vim.fs.joinpath(vim.env.XDG_STATE_HOME or vim.fs.normalize("~/.local/state"), "theme")
	local file = io.open(state)
	local name = file and file:read("*l")
	if file then
		file:close()
	end
	vim.cmd.colorscheme(colorschemes[name] or "nord")
end

return M
