--Remap page up / down to center align
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

--Remap Terminal exit command
vim.api.nvim_set_keymap('t', '<C-t>', '<C-\\><C-n>', { noremap = true, silent = true })

--Yank file name / path
vim.keymap.set('n', '<leader>yp', ':let @+ = expand("%:p")<CR>', { desc = "Copy file path" })
vim.keymap.set('n', '<leader>yn', ':let @+ = expand("%:t")<CR>', { desc = "Copy file name" })

-- Paste without overwriting clipboard in Visual mode
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- yank variable under cursor to clipboard
vim.keymap.set('n', '<leader>yv', '"+yiw', { desc = "Copy variable to clipboard" })

-- other mappings
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true })

-- switch source / header
vim.keymap.set("n", "<leader>sw", function()
  local params = { uri = vim.uri_from_bufnr(0) }
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(_, result)
    if result then
      vim.cmd("edit " .. vim.uri_to_fname(result))
    else
      print("No corresponding source/header file found!")
    end
  end)
end, { desc = "Switch between source and header" })

-- Enable folding for QML file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qml", "cpp", "javascript" }, -- Multiple file types
  callback = function()
    vim.opt_local.foldmethod = "indent"  -- Set indent-based folding
    vim.opt_local.foldenable = false     -- Do not fold by default
  end,
})

-- Enable modifiable for quick fix window
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "quickfix",
  command = "setlocal modifiable"
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "quickfix",
  command = "setlocal nomodifiable"
})

--Nvim Tree shortcuts
vim.keymap.set("n", "<leader>o", ":NvimTreeFindFile<CR>", { desc = "Reveal current file in NvimTree" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Tree"})


--File shorcuts
vim.keymap.set('n', '<leader>ts', ':tab split<CR>', { desc = 'Open current buffer in new tab' })


-- Remap split horizontal / vertical to change cursor focus
vim.api.nvim_set_keymap('n', '<C-w>s', ':split<CR><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>v', ':vsplit<CR><C-w>l', { noremap = true, silent = true })



-- Switch between fold syntax and indent methods
vim.keymap.set("n", "<leader>fm", function()
  local current = vim.opt.foldmethod:get()
  if current == "indent" then
    vim.opt.foldmethod = "syntax"
    print("foldmethod=syntax")
  else
    vim.opt.foldmethod = "indent"
    print("foldmethod=indent")
  end
end, { desc = "Toggle foldmethod between indent and syntax" })
