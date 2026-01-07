return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()
    require("nvim-treesitter").install({
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "svelte",
      "typescript",
      "vue",
      "yaml",
    })
  end,
}
