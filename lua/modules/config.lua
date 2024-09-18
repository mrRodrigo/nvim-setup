vim.cmd("language en_US")

vim.cmd("set clipboard=unnamed")


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.relativenumber = true

--vim.opt.shiftwidth = 4
--vim.opt.tabstop = 4
--vim.opt.softtabstop = 4


-- set space for ident
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smartindent=true

