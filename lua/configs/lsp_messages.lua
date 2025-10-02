vim.diagnostic.config({
  virtual_text = {
    source = "always",  -- show diagnostic source
    prefix = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = "✖",  -- heavy cross
        [vim.diagnostic.severity.WARN]  = "⚠",  -- warning triangle
        [vim.diagnostic.severity.INFO]  = "ℹ",  -- info symbol
        [vim.diagnostic.severity.HINT]  = "💡",  -- light bulb (requires Nerd Font)
      }
      return icons[diagnostic.severity] or "●"
    end,
    spacing = 1,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
