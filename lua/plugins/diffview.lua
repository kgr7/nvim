return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
        "DiffviewOpen",
        "DiffviewFileHistory",
        "DiffviewClose",
        "DiffviewFocusFiles",
        "DiffviewToggleFiles",
        "DiffviewRefresh",
        "DiffviewLog",
    },
    config = function()
        require("diffview").setup({
            enhanced_diff_hl = true,
            use_icons = true,
            icons = {
                folder_closed = "",
                folder_open = "",
            },
        })
    end,
}
