return {
	{ "nvim-mini/mini.comment", version = "*", opts = {} }, -- comment/uncomment lines
	{ "nvim-mini/mini.surround", version = "*", opts = {} }, -- surround a word with characters
	{ "nvim-mini/mini.indentscope", version = "*", opts = {} }, -- visualize scope with animated vertical line
	{
		"nvim-mini/mini.notify",
		version = "*",
		-- Neovim's floating-window border/title row hard-fills its background
		-- with an unrelated near-black colour rather than passing it through,
		-- even once FloatBorder/FloatTitle are cleared and regardless of border
		-- style. winblend forces the row into nvim's own blend compositing
		-- instead, which resolves it to a real nord colour. The body text isn't
		-- affected and stays genuinely transparent.
		opts = { window = { winblend = 100 } },
	}, -- shows notification in floating window
}
