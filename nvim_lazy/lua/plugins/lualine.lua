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
      vim.t[vim.fn.tabpagenr()].name = opts.args
      lualine.refresh()
    end, {
      nargs = 1,
    })

    -- Generate tabline showing all tabs
    local function tabline()
      local tabs = {}
      local current = vim.fn.tabpagenr()
      local total = vim.fn.tabpagenr("$")

      for i = 1, total do
        local name = vim.t[i].name

        -- If tab has no custom name, use the current buffer name
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

        -- Highlight current tab
        if i == current then
          table.insert(
            tabs,
            "%#TabLineSel# " .. name ..
            " %#TabLineNumber# " .. i ..
            " "
          )
        else
          table.insert(
            tabs,
            "%#TabLine# " .. name ..
            " %#TabLineNumber# " .. i ..
            " "
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

      -- Existing statusline
      sections = {
        lualine_c = { "filename" },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
        },
      },

      -- Tabline
      tabline = {
        lualine_a = {
          tabline,
        },
      },
    })
  end,
}
