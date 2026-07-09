return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
        -- Remove background color from the NvimTree window (ui fix)
        vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

        require("nvim-tree").setup({
            filters = {
                dotfiles = false,             -- show all dotfiles (.env, .gitignore, etc.)
                git_ignored = false,          -- show git-ignored files
                custom = { "^\\.DS_Store$" }, -- always hide only .DS_Store
            },
            view = {
                adaptive_size = true,
            },
        })
    end,
}
