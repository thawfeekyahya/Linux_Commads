local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")  -- ✅ Corrected reference


require('telescope').setup({
  extensions = {
    git_worktree = {},
  },
  defaults = {
    layout_strategy = "horizontal",  -- Use horizontal layout for better preview
    layout_config = {
      preview_width = 0.5,  -- Adjust preview window width
    },
    --file_ignore_patterns = { "node_modules", ".git" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden", 
      "--no-ignore"
    },
    mappings = {
      i = {
        ["<C-p>"] = action_layout.toggle_preview,  -- ✅ Fixed reference
        ["<C-l>"] = actions.preview_scrolling_right,
        ["<C-h>"] = actions.preview_scrolling_left,
      },
    },
  },

  pickers = {  -- ✅ Moved `pickers` outside `defaults`
    find_files = {
      previewer = true,   -- ✅ Ensure previewer is enabled
    },
    live_grep = {
      previewer = true,   -- ✅ Enable preview for live grep
      additional_args = function()
        return { "--hidden", "--no-ignore" }
      end
    }
  }
})

-- Keymaps
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Find Recent Files' })
vim.keymap.set("n", "<leader>gl", ":Telescope git_bcommits<CR>", { desc = "View Git Log for Current File" })
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', { desc = "Search Symbols" })

-- Reference search
vim.keymap.set("n", "rs", require('telescope.builtin').lsp_references, { desc = "Find function references" })

-- Telescope marks
vim.keymap.set('n', '<leader>tm', require('telescope.builtin').marks, { desc = "Open Marks Picker" })
