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
vim.keymap.set('n', '<C-w>t', ':tab split<CR>', { desc = 'Open current buffer in new tab' })


-- Remap split horizontal / vertical to change cursor focus
vim.api.nvim_set_keymap('n', '<C-w>s', ':split<CR><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>v', ':vsplit<CR><C-w>l', { noremap = true, silent = true })


-- Enable folding globally
vim.opt.foldenable = true 

-- Switch between fold manual,syntax,indent methods LOCALLY 
local fold_methods = { "manual", "indent", "syntax" }

vim.keymap.set("n", "<leader>tf", function()
  local current = vim.opt_local.foldmethod:get()
  local next_index = 1
  for i, method in ipairs(fold_methods) do
    if method == current then
      next_index = i % #fold_methods + 1
      break
    end
  end
  local next_method = fold_methods[next_index]
  vim.opt_local.foldmethod = next_method
  vim.notify("foldmethod = " .. next_method, vim.log.levels.INFO)
end, { desc = "Cycle foldmethod" })
