return {
	"mbbill/undotree",
	cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeFocus", "UndotreeHide" },
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
	},
	init = function()
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}
