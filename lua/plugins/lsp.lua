vim.lsp.config('roslyn', {})

vim.lsp.on_type_formatting.enable()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

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

