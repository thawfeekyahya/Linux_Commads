return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure this dependency is installed
  config = function()

    require("nvim-tree").setup {
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Custom keybinding for opening a file in system explorer
        vim.keymap.set("n", "<C-e>", function()
          local node = api.tree.get_node_under_cursor()
          if node and node.absolute_path then
            local open_cmd = vim.fn.has("mac") == 1 and "open" or "xdg-open"
            vim.fn.system(open_cmd .. " '" .. node.absolute_path .. "' &")
          end
        end, opts("Open in system explorer"))
      end
    }
  end
}
