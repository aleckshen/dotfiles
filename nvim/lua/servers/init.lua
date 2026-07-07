-- per-server LSP overrides; shared capabilities come from vim.lsp.config("*")
-- installation and enabling are handled by mason-lspconfig
require("servers.clangd")
require("servers.emmet_ls")
require("servers.lua_ls")
require("servers.pyright")
require("servers.tailwindcss")
require("servers.ts_ls")
