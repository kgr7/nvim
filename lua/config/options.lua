-- core settings
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.fillchars = { eob = " " }

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- split management
vim.opt.splitbelow = true
vim.opt.splitright = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- search and undo
vim.opt.incsearch = true
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.updatetime = 250

vim.api.nvim_create_autocmd({
    "FocusGained",
    "BufEnter",
    "CursorHold",
    "CursorHoldI",
}, {
    pattern = "*",
    command = "checktime",
})

-- fill characters for status bar, used by vim 
vim.opt.fillchars:append({ stl = '─' })

-- replace diagnostic signs with icons
vim.diagnostic.config({
    underline = false,
    virtual_text = false,
    float = {
        border = "single",
        format = function(diagnostic)
            local code = diagnostic.code or vim.tbl_get(diagnostic, "user_data", "lsp", "code") or "?"
            return string.format(
                "%s (%s) [%s]",
                diagnostic.message,
                diagnostic.source or "unknown",
                code
            )
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "" ,
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT]  = "󰌶",
            [vim.diagnostic.severity.INFO]  = "",
        },
    }
})

vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

 -- method/tag folding (managed by nvim-ufo)
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
