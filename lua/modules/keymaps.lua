vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- split buffers
vim.keymap.set("n", "|", "<Cmd>vsplit <CR>")

vim.keymap.set("n", "-", "<Cmd>split <CR>")
