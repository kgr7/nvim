return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup()

      -- install the parsers we need
      local parsers = { "c_sharp", "html", "css", "json", "lua", "vim", "vimdoc", "razor", "typescript", "javascript" }
      require("nvim-treesitter").install(parsers)

      -- start highlighting for these filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "cs", "razor", "html", "css", "json", "lua", "typescript", "javascript" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
