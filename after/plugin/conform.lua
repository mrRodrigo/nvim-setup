local options = {
  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
  format_after_save = {
    lsp_fallback = true,
  },
  log_level = vim.log.levels.ERROR,
  notify_on_error = false,
  formatters = {
    ["goimports-reviser"] = {
      args = { "-rm-unused", "-set-alias", "-format", "$FILENAME" },
    },
  },
  formatters_by_ft = {
    --javascript = ,
    typescript = { "tsserver", "prettier", "eslint_d" },
    --  go = { "goimports-reviser", "gofumpt" },
    lua = { "stylua" },
  },
}

require("conform").setup(options)
