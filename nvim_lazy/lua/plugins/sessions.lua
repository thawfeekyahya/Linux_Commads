return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" },

  keys = {
    { "<leader>sl", "<cmd>AutoSession search<CR>", desc = "List sessions" },
    { "<leader>ss", "<cmd>AutoSession save<CR>", desc = "Save session" },
    { "<leader>sd", "<cmd>AutoSession delete<CR>", desc = "Delete current session" },
    { "<leader>sD", "<cmd>AutoSession deletePicker<CR>", desc = "Delete session (picker)" },
  },

  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_save_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "/", "~/Downloads" },
      session_lens = {
        load_on_setup = true,
        previewer = false,
        theme_conf = {
          layout_strategy = "vertical",
          layout_config = {
            height = 0.8,
            width = 0.8,
          },
        },
      },
    })

    -- Helper function to fetch session files across different auto-session versions
    local function get_sessions()
      if auto_session.get_session_files then
        return auto_session.get_session_files()
      end

      local ok_lib, lib = pcall(require, "auto-session.lib")
      if ok_lib and lib.get_session_files then
        return lib.get_session_files()
      end

      -- Fallback: Scan Neovim session directory directly
      local session_dir = vim.fn.stdpath("data") .. "/sessions/"
      if vim.fn.isdirectory(session_dir) == 1 then
        return vim.fn.glob(session_dir .. "*.vim", false, true)
      end

      return {}
    end

    -- Custom User Command to delete range/indices from the session list
    -- Usage: :AutoSessionDeleteRange 1 25
    vim.api.nvim_create_user_command("AutoSessionDeleteRange", function(opts)
      local session_files = get_sessions()

      local args = vim.split(opts.args, "%s+")
      local start_idx = tonumber(args[1])
      local end_idx = tonumber(args[2]) or start_idx

      if not start_idx then
        vim.notify("Usage: :AutoSessionDeleteRange <start_index> [end_index]", vim.log.levels.ERROR)
        return
      end

      local deleted_count = 0
      for i = start_idx, end_idx do
        local entry = session_files[i]
        if entry then
          -- Get path string whether entry is a table or string path
          local session_path = type(entry) == "table" and (entry.path or entry[1]) or entry
          if session_path and vim.fn.delete(session_path) == 0 then
            deleted_count = deleted_count + 1
          end
        end
      end

      vim.notify(string.format("Successfully deleted %d session(s).", deleted_count), vim.log.levels.INFO)
    end, { nargs = "+" })
  end,
}
