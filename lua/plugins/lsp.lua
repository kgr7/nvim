vim.lsp.config('roslyn', {})

return {
 {
    "mason-org/mason.nvim", opts = {},
 },
 {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason.nvim" },
  },
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    lazy = false,
    ft = { "cs", "razor" },
    opts = {},
    config = function()
      vim.filetype.add({
        extension = {
        razor = "razor",
        cshtml = "razor"
      },
    })
  end,
  },
}

