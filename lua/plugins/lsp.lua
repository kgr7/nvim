vim.filetype.add({
  extension = {
    razor = "razor",
    cshtml = "razor",
  },
})

-- Consider disabling this while testing Razor performance
vim.lsp.on_type_formatting.enable()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.lsp.enable("roslyn_ls")

vim.lsp.config("roslyn_ls", {
    filetypes = { "razor", "cs" },

    settings = {
        -- better performance
        ["csharp|background_analysis"] = {
            dotnet_compiler_diagnostics_scope = "openFiles",
            dotnet_analyzer_diagnostics_scope = "openFiles",
        }
    }
})

return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        -- Often recommended for newer Roslyn builds
        "github:Crashdummyy/mason-registry",
      },
    },
  }
}
