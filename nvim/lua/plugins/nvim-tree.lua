return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
        -- Remove background color from the NvimTree window (ui fix)
        vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

        require("nvim-tree").setup({
            filters = {
                dotfiles = false,    -- Show hidden files (dotfiles)
                git_ignored = false, -- Show .env and other gitignored files
            },
            view = {
                adaptive_size = true,
            },
        })
    end,
}
