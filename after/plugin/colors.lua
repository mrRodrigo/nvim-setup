-- theme

require('poimandres').setup {
  bold_vert_split = true,           -- use bold vertical separators
  dim_nc_background = false,        -- dim 'non-current' window backgrounds
  disable_background = false,       -- disable background
  disable_float_background = false, -- disable background for floats
  disable_italics = false,          -- disable italics
}


vim.cmd.colorscheme("poimandres")

--vim.cmd("colorscheme miasma")


vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
