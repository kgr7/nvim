local dotnet = require("easy-dotnet")

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
          theme = {
              normal = {
                a = { bg = nil },
                b = { bg = nil },
                c = { bg = nil },
              }
          },
          component_separators = { left = nil, right = nil }
        },
      sections = {
        lualine_a = { "mode", dotnet.lualine.jobs },
        lualine_c = { 
            {
                function()
                    return "filename |"
                end,
                padding = { left = 1 }
            },
        },
        lualine_x = {
          { function() return '|' end },
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
