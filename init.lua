require("config.lazy") 

vim.cmd.colorscheme("tokyonight")

vim.filetype.add({
  extension = {
    razor = "razor",
    cshtml = "razor"
  },
})
