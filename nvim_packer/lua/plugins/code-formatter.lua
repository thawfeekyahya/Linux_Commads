require("formatter").setup({
filetype = {
          cpp = { require("formatter.filetypes.cpp").clangformat },
          qml = {
            function()
              return {
                exe = "qmlformat",
                args = { "--indent", "4", "-" },
                stdin = true,
              }
            end
          }
        }
})

