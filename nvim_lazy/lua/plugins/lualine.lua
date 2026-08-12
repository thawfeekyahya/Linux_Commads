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
      local tabpages = vim.api.nvim_list_tabpages()
      local current_tab = vim.fn.tabpagenr()
      local tabpage_id = tabpages[current_tab]

      vim.t[tabpage_id].name = opts.args

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
        local name = vim.t[tabpage_id].name

        -- If tab has no custom name, use current buffer name
        if not name or name == "" then
          local buflist = vim.fn.tabpagebuflist(i)
          local bufnr = buflist[1]

          name = vim.fn.bufname(bufnr)

          if name == "" then
            name = "[No Name]"
          else
            name = vim.fn.fnamemodify(name, ":t")
          end
        end

        -- Tab number
        local label = name .. " "

        -- Current tab
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
