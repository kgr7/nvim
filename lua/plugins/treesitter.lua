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
        callback = function(args)
          vim.treesitter.start()
          -- parse(true) forces a complete parse including injection trees (e.g. HTML
          -- within Lit html`...` template literals). Without this, fold providers see
          -- only the root tree because parse(nil) skips injections entirely, and the
          -- injection trees are only parsed lazily during the first window redraw.
          local parser = vim.treesitter.get_parser(args.buf)
          if parser then
            parser:parse(true)
          end
        end,
      })
    end,
  },
}
