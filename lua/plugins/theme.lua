return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm",     -- "storm", "dark", or "night"
      transparent = true,  -- Enables transparency for the main window
      styles = {
        sidebars = "transparent", -- Transparent file tree (NvimTree/Neo-tree)
        floats = "transparent",   -- Transparent popups and floating windows
        comments = { italic = true },
        keywords = { italic = false },
      },
      on_highlights = function(hl, c)
        hl.StatusLine = { bg = "NONE" }
        hl.StatusLineNC = { bg = "NONE" }
      end,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}

