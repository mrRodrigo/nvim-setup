vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- split buffers
vim.keymap.set("n", "|", "<Cmd>vsplit <CR>")

vim.keymap.set("n", "-", "<Cmd>split <CR>")

-- navigate between buffers

vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>")

-- open integrated terminal

