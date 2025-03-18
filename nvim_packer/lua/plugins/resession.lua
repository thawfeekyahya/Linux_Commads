local resession = require("resession")
resession.setup()

vim.keymap.set("n", "<Leader>ss", function()
  resession.save(vim.fn.getcwd(), { attach = true }) -- Save session dynamically
end, { desc = "Save session with bookmarks" })

vim.keymap.set("n", "<Leader>sl", function()
  resession.load(vim.fn.getcwd()) -- Load session
end, { desc = "Load session with bookmarks" })
