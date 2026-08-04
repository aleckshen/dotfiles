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
		keymaps = {
			["q"] = "actions.close",
			["<C-c>"] = false,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)

		-- oil's save-confirmation popup only binds y/Y/o/O to confirm and
		-- n/N/c/C/q/<Esc>/<C-c> to cancel; add <CR> as a closer confirm key
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil_preview",
			callback = function(args)
				vim.keymap.set("n", "<CR>", "y", { buffer = args.buf, remap = true })
			end,
		})
	end,
}
