-- restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- tree sitter auto commands
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ft = vim.bo.filetype

    -- Map filetype to treesitter language
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    -- Safely start Tree-sitter
    pcall(vim.treesitter.start)

    -- disable regex highlighting
    vim.bo.syntax = "off"

    -- enable tree-sitter indentation
    vim.bo.indentexpr =
      "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- format on save using efm langserver and configured formatters
local lsp_fmt_group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function()
        local efm = vim.lsp.get_clients({ name = "efm" })
        if vim.tbl_isempty(efm) then
            return
        end
        vim.lsp.buf.format({ name = "efm", async = true })
    end,
})

-- format on save using efm langserver and configured formatters
local lsp_fmt_group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function()
        local efm = vim.lsp.get_clients({ name = "efm" })
        if vim.tbl_isempty(efm) then
            return
        end
        vim.lsp.buf.format({ name = "efm", async = true })
    end,
})

-- on attach function shortcuts
local on_attach = require("utils.lsp").on_attach
local lsp_on_attach_group = vim.api.nvim_create_augroup("LspMappings", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_on_attach_group,
    callback = on_attach,
})
