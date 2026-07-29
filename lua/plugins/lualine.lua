local dotnet = require("easy-dotnet")

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      sections = {
        lualine_a = { "mode", dotnet.lualine.jobs },
        lualine_x = {
          dotnet.lualine.active_project,
          {
            dotnet.lualine.run_status,
            color    = dotnet.lualine.run_status_color,
            on_click = dotnet.lualine.run_status_click,
          },
        },
      },
    },
  }
}
