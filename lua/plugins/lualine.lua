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
                        b = { bg = nil, fg = '#3B4252' },
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
                            local name = vim.fn.expand('%:t')
                            if name == '' then
                                name = '[No Name]'
                            end
                            return name .. ' │'
                        end,
                        color = { fg = '#3B4252' },
                        padding = { left = 1 }
                    },
                },
                lualine_x = {
                    {
                        function() return '│' end,
                        color = { fg = '#3B4252' },
                        padding = { left = 0 }
                    },
                    {
                        'lsp_status',
                        icon = '', -- optional nerd-font icon
                        symbols = {
                            spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                            done = '✓',
                            separator = ' ',
                        },
                        ignore_lsp = { 'GitHub Copilot', 'easy_dotnet_in_process' },  -- e.g. { 'null-ls' } to hide noisy attached servers
                        show_name = true, -- set false if you just want the spinner/checkmark, no client name
                        color = { fg = '#3B4252' },
                    },
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
