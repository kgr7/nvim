vim.lsp.enable("rust-analyzer")
vim.lsp.enable("lua_ls")
vim.lsp.enable("somesass_ls")

return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
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
