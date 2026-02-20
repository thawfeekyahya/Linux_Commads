return {
    {
      "David-Kunz/gen.nvim",
      cmd = "Gen",
      config = function()
        require("gen").setup({
          -- Replace with your specific tag, e.g., "deepseek-r1:7b" or "deepseek-r1:14b"
          model = "deepseek-coder-v2", 
          display_mode = "float",
          show_prompt = true,
          show_model = true,
          no_auto_close = false,
          -- Ollama specific settings
          host = "localhost",
          port = "11434",
          -- We revert to the default command function for Ollama
          command = function(options)
            return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/generate -d $body"
          end,
          -- The response parsing for Ollama is different from Gemini
          extract_json = "response",
        })
    
        -- Updated Keymaps description
        vim.keymap.set({ "n", "v" }, "<leader>gm", ":Gen<CR>", { desc = "Ollama AI Menu" })
      end,
    },
    {
        "github/copilot.vim"
    }
}
