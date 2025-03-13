local lspconfig = require("lspconfig")
local util = require('lspconfig.util')

lspconfig.clangd.setup({ 
	cmd = { "clangd", "--background-index" },
        filetypes = { "cpp", "c", "h" } 
})

-- Enable QML LSP (qmlls)
lspconfig.qmlls.setup{
    cmd = { "qmlls" },  -- Make sure to add qt install path to your env PATH 
    filetypes = { "qml", "qmljs" },
    root_dir = util.root_pattern(".qmlls.ini", "CMakeLists.txt")
}

lspconfig.cmake.setup({
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_dir = require("lspconfig.util").root_pattern("CMakeLists.txt", ".git"),
})

-- Toggle LSP Warnings
vim.keymap.set("n", "<leader>tw", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = not current,
  })
end, { desc = "Toggle LSP Warnings" })

-- LSP Powered Code Completion
vim.api.nvim_set_keymap("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })

