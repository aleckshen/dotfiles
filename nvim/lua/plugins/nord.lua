return {
  {
    "gbprod/nord.nvim",
    lazy = false,      
    priority = 1000,  
    config = function()
      require("nord").setup({
        -- optional settings
        transparent = false,
        terminal_colors = true,
      })

      vim.cmd.colorscheme("nord")
    end,
  },
}