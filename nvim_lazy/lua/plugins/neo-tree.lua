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
          ["Y"] = function(state)
          -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
          -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local results = {
            filepath,
            modify(filepath, ':.'),
            modify(filepath, ':~'),
            filename,
            modify(filename, ':r'),
            modify(filename, ':e'),
          }

          -- absolute path to clipboard
          local i = vim.fn.inputlist({
            'Choose to copy to clipboard:',
            '1. Absolute path: ' .. results[1],
            '2. Path relative to CWD: ' .. results[2],
            '3. Path relative to HOME: ' .. results[3],
            '4. Filename: ' .. results[4],
            '5. Filename without extension: ' .. results[5],
            '6. Extension of the filename: ' .. results[6],
          })

          if i > 0 then
            local result = results[i]
            if not result then return print('Invalid choice: ' .. i) end
            vim.fn.setreg('"', result)
            vim.notify('Copied: ' .. result)
          end
        end
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

