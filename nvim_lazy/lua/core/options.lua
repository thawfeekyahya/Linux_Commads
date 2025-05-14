-- Set Default Theme
vim.cmd("colorscheme rose-pine-main")

vim.opt.tags = { "./tags", "tags" }
vim.opt.cursorline = true
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd("filetype plugin indent on")
vim.o.winbar = "%=%{winnr()} %f"

-- Use spaces instead of tabs
vim.opt.expandtab = true  -- This makes Vim insert spaces instead of a tab character

-- Set the number of spaces for indentation
vim.opt.shiftwidth = 2     -- Number of spaces to use for indentation (adjust to your preference)
vim.opt.tabstop = 2        -- Number of spaces a tab represents (adjust to your preference)
vim.opt.softtabstop = 2

-- Charcters Markings
vim.opt.listchars = {
  tab = '▸ ',
  trail = '^',
  space = '·',
}

vim.filetype.add({
  extension = {
    qml = "qmljs",
  }
})


vim.diagnostic.config({
	virtual_text = true, 
  signs = true, 
  update_in_insert = false ,
  underline = false,     -- disables squiggly lines
})

-- Indendation settings for C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  command = "setlocal tabstop=4 shiftwidth=4 expandtab"
})

-- Show time after writting the file
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    local time = os.date("%I:%M %p")
    --local file = vim.fn.expand("%:p")
    vim.api.nvim_echo({{ "Wrote "  .. " at " .. time, "None" }}, false, {})
  end,
})
