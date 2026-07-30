-- lua/plugins/neo-tree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional but recommended
  },

  init = function()
    -- recommended: disable netrw since neo-tree replaces it
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  keys = {
    { "<leader>e", "<cmd>Neotree toggle filesystem left<cr>", desc = "Explorer" },
    { "<leader>E", "<cmd>Neotree reveal filesystem left<cr>", desc = "Explorer Reveal Current File" },
    { "<leader>be", "<cmd>Neotree toggle buffers right<cr>", desc = "Buffer Explorer" },
    { "<leader>ge", "<cmd>Neotree toggle git_status float<cr>", desc = "Git Explorer" },
  },

  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,

    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },

    source_selector = {
      winbar = true,
      statusline = false,
    },

    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },

    window = {
      position = "left",
      width = 32,
      mappings = {
        ["<space>"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
      },
    },

    filesystem = {
      bind_to_cwd = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true,
      group_empty_dirs = true,
      hijack_netrw_behavior = "open_default",

      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },

      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
        },
      },
    },

    buffers = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
}
