local lspconfig = require("lspconfig")

lspconfig.clangd.setup({ 
	cmd = { "clangd", "--background-index" },
        filetypes = { "cpp", "c", "h" } 
})

-- Enable QML LSP (qmlls)
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

lspconfig.qmlls.setup{
    cmd = (function()
        -- Find the project root
        local root_dir = util.root_pattern("CMakeLists.txt", ".git")(vim.fn.getcwd())

        -- If a project-specific qmlls.json exists, use it
        if root_dir then
            local qmlls_config = root_dir .. "/qmlls.json"
            if vim.fn.filereadable(qmlls_config) == 1 then
                return { "qmlls", "-I", qmlls_config }
            end
        end

        -- Default fallback if no config is found
        return { "qmlls" }
    end)(),
    filetypes = { "qml" },
    root_dir = util.root_pattern(".qmlls.ini", "CMakeLists.txt")
}


vim.diagnostic.config({
	virtual_text = true, signs = true, update_in_insert = false 
})


-- Toggle LSP Warnings
vim.keymap.set("n", "<leader>tw", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = not current,
  })
end, { desc = "Toggle LSP Warnings" })
