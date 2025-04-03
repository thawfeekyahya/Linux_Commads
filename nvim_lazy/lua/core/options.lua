-- Set Default Theme
vim.cmd("colorscheme rose-pine-main")

vim.opt.tags = { "./tags", "tags" }
vim.opt.cursorline = true
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd("filetype plugin indent on")
vim.o.winbar = "%=%{winnr()} %f"

vim.filetype.add({
  extension = {
    qml = "qmljs",
  }
})


vim.diagnostic.config({
	virtual_text = true, signs = true, update_in_insert = false 
})


-- Indendation settings for C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  command = "setlocal tabstop=4 shiftwidth=4 expandtab"
})
