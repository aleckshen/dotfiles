return {
	{ "nvim-mini/mini.comment", version = "*", opts = {} }, -- comment/uncomment lines
	{ "nvim-mini/mini.surround", version = "*", opts = {} }, -- surround a word with characters
	{ "nvim-mini/mini.indentscope", version = "*", opts = {} }, -- visualize scope with animated vertical line
	{
		"nvim-mini/mini.notify",
		version = "*",
		-- Neovim's floating-window border/title row hard-fills its background
		-- rather than truly passing it through, even once FloatTitle/FloatBorder
		-- are cleared, so with terminal transparency on it renders as an ugly
		-- solid bar. Dropping the border removes that row entirely.
		opts = { window = { config = { border = "none" } } },
	}, -- shows notification in floating window
}
