vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", vim.cmd.w)

vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle )

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

