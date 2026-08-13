return {
  -- Statusline
  "nvim-lualine/lualine.nvim",

  config = function()
    local lualine = require("lualine")

    -- Highlight group for tab numbers
    vim.api.nvim_set_hl(0, "TabLineNumber", {
      bold = true,
    })

    -- Name the current tab
    vim.api.nvim_create_user_command("TabName", function(opts)
      -- Setting vim.t.name directly on the current tabpage binds it 
      -- accurately to Neovim's session serialization
      vim.t.name = opts.args
      lualine.refresh()
    end, {
      nargs = 1,
    })

    -- Generate tabline
    local function tabline()
      local tabs = {}
      local tabpages = vim.api.nvim_list_tabpages()
      local current = vim.fn.tabpagenr()
      local total = #tabpages

      for i = 1, total do
        local tabpage_id = tabpages[i]

        -- Safely retrieve the custom tab name from tab variables
        local ok, name = pcall(vim.api.nvim_tabpage_get_var, tabpage_id, "name")

        -- If tab has no custom name, fallback to current buffer name
        if not ok or not name or name == "" then
          local buflist = vim.fn.tabpagebuflist(i)
          local bufnr = buflist[1]

          name = vim.fn.bufname(bufnr)

          if name == "" then
            name = "[No Name]"
          else
            name = vim.fn.fnamemodify(name, ":t")
          end
        end

        -- Tab number label
        local label = name .. " "

        -- Current active tab vs inactive tabs
        if i == current then
          table.insert(
            tabs,
            "%#TabLineSel# " .. label ..
            "%#TabLineNumber# " .. i .. " "
          )
        else
          table.insert(
            tabs,
            "%#TabLine# " .. label ..
            "%#TabLineNumber# " .. i .. " "
          )
        end
      end

      return table.concat(tabs, "%#TabLineFill#│")
    end

    lualine.setup({
      options = {
        theme = "auto",

        section_separators = {
          left = "",
          right = "",
        },

        component_separators = {
          left = " ",
          right = " ",
        },
      },

      sections = {
        lualine_c = { "filename" },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
        },
      },

      tabline = {
        lualine_a = {
          tabline,
        },
      },
    })
  end,
}
