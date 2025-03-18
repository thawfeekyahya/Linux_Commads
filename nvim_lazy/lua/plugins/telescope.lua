return {

"nvim-telescope/telescope.nvim" ,

 config = function() 
  local actions = require("telescope.actions")
  local action_layout = require("telescope.actions.layout")  -- ✅ Corrected reference
  
  
  require('telescope').setup({
    extensions = {
      git_worktree = {},
      fzf = {},
    },
    defaults = {
      layout_strategy = "vertical",  -- Use horizontal layout for better preview
      layout_config = {
        preview_height = 0.7,  -- Adjust preview window width
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
        "--no-ignore",
        "-g", "!tags"
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
      find_files = {},
      live_grep = {
        additional_args = function()
          return { "--hidden", "--no-ignore" }
        end
      }
    }
  })
  
  -- Load marks extension
  require('telescope').load_extension("fzf")
  require('telescope').load_extension("git_worktree")

  -- Keymaps
  vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
  vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
  vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffers' })
  vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Find Recent Files' })
  vim.keymap.set("n", "<leader>gl", ":Telescope git_bcommits<CR>", { desc = "View Git Log for Current File" })
  vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', { desc = "Search Symbols" })
  vim.keymap.set("n", "<Leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorscheme Picker" })
  
  -- Reference search
  vim.keymap.set("n", "rs", "<cmd>Telescope lsp_references<CR>", { desc = "Find function references" })

  -- Telescope marks
  vim.keymap.set('n', '<leader>tm', require('telescope.builtin').marks, { desc = "Open Marks Picker" })

  end,
}
