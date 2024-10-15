local lint = require "lint"

lint.linters_by_ft = {
  typescript = { "eslint" },
  javascript = { "eslint" },
  -- typescriptreact = { "eslint", "biomejs" },
  -- javascriptreact = { "eslint", "biomejs" },
  -- go = { "golangcilint" },
}

local eslint = lint.linters.eslint_d

eslint.args = {
  "--no-warn-ignored",
  "--format",
  "json",
  "--stdin",
  "--stdin-filename",
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
