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
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true





vim.opt.spell = true
vim.opt.spelllang = "en_us"



-- Enable neovim to be the external editor for Godot, if the cwd has a project.godot file
if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local addr = './godot.pipe'
  if vim.fn.has 'win32' == 1 then
    -- Windows can't pipe so use localhost. Make sure this is configured in Godot
    addr = '127.0.0.1:6004'
  end
  vim.fn.serverstart(addr)
end
