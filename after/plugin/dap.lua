local dap = require("dap")

-- KEYMAP

vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>dr", ":DapContinue <CR>")

