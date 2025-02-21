-------------------------------------------------------
-- None-ls (integrator of formatters as LSP servers) --
-------------------------------------------------------

-- Mason tool installer: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
-- https://github.com/nvimtools/none-ls.nvim

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          "stylua", -- Formatter for LUA
          "clang-format", -- Formatter for C
          "black", -- Formatter for Python (requires Python >3.9)
          "isort" -- Formatter for the imports of Python (requires Python >3.9)
        }
      })
    end
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort
      })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "none-ls: format file" })
    end
  }
}
