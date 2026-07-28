vim.lsp.enable("rust-analyzer")

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
