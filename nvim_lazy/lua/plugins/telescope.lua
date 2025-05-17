return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local action_state = require("telescope.actions.state")

    -- ========================================================================================================================
    -- 🔍 Global Marks Picker
    local function open_global_marks()
      local marks = vim.fn.getmarklist()
      local global_marks = vim.tbl_filter(function(mark)
        local name = mark.mark:sub(2, 2)
        return name:match("%u") -- A-Z
      end, marks)

      local entries = {}
      for _, mark in ipairs(global_marks) do
        local pos = mark.pos
        local filename = vim.fn.bufname(pos[1])
        table.insert(entries, {
          filename = filename,
          lnum = pos[2],
          col = pos[3],
          text = string.format("Mark '%s'", mark.mark:sub(2, 2)),
          value = filename,
          ordinal = filename .. pos[2],
          display = string.format("'%s'  %s:%d:%d", mark.mark:sub(2, 2), filename, pos[2], pos[3])
        })
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Global Marks",
        finder = require("telescope.finders").new_table {
          results = entries,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry.display,
              ordinal = entry.ordinal,
              filename = entry.filename,
              lnum = entry.lnum,
              col = entry.col,
            }
          end,
        },
        sorter = require("telescope.config").values.generic_sorter({}),
        previewer = require("telescope.previewers").vim_buffer_cat.new({}),
        attach_mappings = function(_, map)
          local function jump(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd("edit " .. entry.filename)
            vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col })
          end
          map("i", "<CR>", jump)
          map("n", "<CR>", jump)
          return true
        end,
      }):find()
    end

    -- ------------------------------------------------------------------------------------------------------------------------
    -- 🔍 Local Marks Picker (a–z, current file only)
    local function open_local_marks()
      local bufnr = vim.api.nvim_get_current_buf()
      local marks = vim.fn.getmarklist(bufnr)
      local local_marks = vim.tbl_filter(function(mark)
        local name = mark.mark:sub(2, 2)
        return name:match("%l") -- a-z
      end, marks)

      local entries = {}
      for _, mark in ipairs(local_marks) do
        local pos = mark.pos
        local filename = vim.fn.bufname(pos[1])
        table.insert(entries, {
          filename = filename,
          lnum = pos[2],
          col = pos[3],
          text = string.format("Mark '%s'", mark.mark:sub(2, 2)),
          value = filename,
          ordinal = filename .. pos[2],
          display = string.format("'%s'  %s:%d:%d", mark.mark:sub(2, 2), filename, pos[2], pos[3])
        })
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Local Marks",
        finder = require("telescope.finders").new_table {
          results = entries,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry.display,
              ordinal = entry.ordinal,
              filename = entry.filename,
              lnum = entry.lnum,
              col = entry.col,
            }
          end,
        },
        sorter = require("telescope.config").values.generic_sorter({}),
        previewer = require("telescope.previewers").vim_buffer_cat.new({}),
        attach_mappings = function(_, map)
          local function jump(prompt_bufnr)
            local entry = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col })
          end
          map("i", "<CR>", jump)
          map("n", "<CR>", jump)
          return true
        end,
      }):find()
    end

    -- ========================================================================================================================
    require('telescope').setup({
      extensions = {
        git_worktree = {},
        fzf = {},
      },
      defaults = {
        debug = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.7,
        },
        vimgrep_arguments = {
          "rg", "--color=never", "--no-heading", "--with-filename",
          "--line-number", "--column", "--smart-case", "--hidden",
          "--no-ignore", "-g=!tags"
        },
        mappings = {
          i = {
            ["<C-p>"] = action_layout.toggle_preview,
            ["<C-e>"] = function(prompt_bufnr)
              local entry = action_state.get_selected_entry()
              local file_path = entry and entry.path or entry[1]
              if file_path then
                local open_cmd = vim.fn.has("mac") == 1 and "open" or "xdg-open"
                vim.fn.jobstart({ open_cmd, vim.fn.fnamemodify(file_path, ":h") }, { detach = true })
              end
              actions.close(prompt_bufnr)
            end,
          },
          n = {
            ["<Esc>"] = false,
            ["q"] = actions.close,
            ["<C-n>"] = function(prompt_bufnr)
              local entry = action_state.get_selected_entry()
              local filepath = entry.path or entry.filename
              actions.close(prompt_bufnr)
              require("nvim-tree.api").tree.open()
              require("nvim-tree.api").tree.find_file(filepath)
            end,
          }
        },
      },
      pickers = {
        find_files = {},
        live_grep = {
          additional_args = function()
            return { "--hidden", "--no-ignore" }
          end
        },
        git_bcommits = {
          use_git_root = false,
        },
      }
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("git_worktree")

    -- Keymaps
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find Recent Files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search Symbols" })
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorscheme Picker" })
    vim.keymap.set("n", "rs", "<cmd>Telescope lsp_references<CR>", { desc = "Find function references" })

    -- 🔖 Marks Pickers
    vim.keymap.set("n", "<leader>tma", require("telescope.builtin").marks, { desc = "Open All Marks Picker" })
    vim.keymap.set("n", "<leader>tmg", open_global_marks, { desc = "Open Global Marks Picker" })
    vim.keymap.set("n", "<leader>tml", open_local_marks, { desc = "Open Local Marks Picker" })

    -- Git pickers
    vim.keymap.set("n", "<leader>gl", function() require("telescope.builtin").git_bcommits() end, { desc = "Git BCommits" })
    vim.keymap.set("n", "<leader>gL", function() require("telescope.builtin").git_commits() end, { desc = "Git Commits" })

    -- 🔍 Grep by file extension(s)
    vim.keymap.set("n", "<leader>fG", function()
      vim.ui.input({ prompt = "Enter file extensions to grep (e.g. cpp,h,qml): " }, function(input)
        if input and input ~= "" then
          local args = {}
          for ext in string.gmatch(input, "[^,%s]+") do
            table.insert(args, "--glob")
            table.insert(args, "*." .. ext)
          end
          require("telescope.builtin").live_grep({
            additional_args = function()
              return args
            end
          })
        else
          print("No extension provided. Aborting filtered grep.")
        end
      end)
    end, { desc = "Live grep by file extension(s)" })
  end,
}

