return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" },

  keys = {
    { "wl", "<cmd>AutoSession search<CR>", desc = "List sessions" },
    { "ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
  },

  config = function()
    require("auto-session").setup({
      auto_save_enabled = true,
      auto_restore_enabled = true,

      auto_session_suppress_dirs = { "~/", "/", "~/Downloads" },

      session_lens = {
        load_on_setup = true,
        previewer = false, -- IMPORTANT (prevents layout errors)
        theme_conf = {
          layout_strategy = "vertical", -- safe with latest Telescope
          layout_config = {
            height = 0.8,
            width = 0.8,
          },
        },
      },
    })
  end,
}
