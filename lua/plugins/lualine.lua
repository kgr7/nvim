local dotnet = require("easy-dotnet")

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
          theme = {
              normal = {
                a = { bg = nil, fg = '#3B4252' },
                b = { bg = nil, fg = '#3B4252'  },
                c = { bg = nil, fg = '#3B4252' },
              }
          },
          component_separators = { left = nil, right = nil },
          globalstatus = true
        },
      sections = {
        lualine_a = { dotnet.lualine.jobs },
        lualine_c = { 
            {
                function()
                    return "filename │ "
                end,
                color = { fg = '#3B4252' },
                padding = { left = 1 }
            },
        },
        lualine_x = {
          {
              function() return '│' end,
              color = { fg = '#3B4252'}
          },
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
