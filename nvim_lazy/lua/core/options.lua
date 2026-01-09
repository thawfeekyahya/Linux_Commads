-- Set Default Theme
vim.cmd("colorscheme desert")

vim.opt.tags = { "./tags", "tags" }
vim.opt.cursorline = true
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.o.winbar = "%=%{winnr()} %f"


-- ====================================================================================================Set indentation options
vim.cmd("filetype plugin indent on")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true -- This makes Vim insert spaces instead of a tab character

vim.opt.shiftwidth = 4      -- Number of spaces per indent
vim.opt.tabstop = 4         -- Tab character width
vim.opt.softtabstop = 4     -- Tab and backspace behavior in insert mode

-- Optional: Keybindings to auto-indent
vim.keymap.set("n", "<leader>=", "gg=G``", { desc = "Indent entire buffer" })
vim.keymap.set("v", "=", "=gv", { desc = "Indent visual selection" })

-- ==================================================================================================== 

-- switch between buffers
 vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, noremap = true, desc = "Next buffer" })
      -- Previous buffer
      vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true, noremap = true, desc = "Previous buffer" })

-- Charcters Markings
vim.opt.listchars = {
  tab = '▸ ',
  trail = '■',
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


-- Ignore case when searching
vim.opt.ignorecase = true  -- Ignore case in search
vim.opt.smartcase = true   -- But be smart: if you type uppercase, match case


