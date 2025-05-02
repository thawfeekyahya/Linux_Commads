return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",  -- Use the stable v3 branch
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = { padding = 1 },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "➜",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "toggle_node",
	  ["<C-e>"] = function(state)
             local node = state.tree:get_node()
             local path = node:get_id()
             if path then
               local open_cmd = vim.fn.has("mac") == 1 and "open"
                 or vim.fn.has("unix") == 1 and "xdg-open"
                 or vim.fn.has("win32") == 1 and "start"
               vim.fn.jobstart({ open_cmd, path }, { detach = true })
             end
         end,
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = true,
      },
      git_status = {
        window = {
          position = "right",
        },
      },
    })

    -- Optional keybindings
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
    vim.keymap.set("n", "<leader>o", "<cmd>Neotree reveal<CR>", { desc = "Reveal file in Neo-tree" })
  end
}

