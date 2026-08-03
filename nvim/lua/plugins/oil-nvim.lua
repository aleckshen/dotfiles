return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<Cmd>Oil<CR>", desc = "Open parent directory" },
		{ "<leader>e", "<Cmd>Oil<CR>", desc = "Open parent directory" },
	},
	opts = {
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				return name == ".DS_Store"
			end,
		},
	},
}
