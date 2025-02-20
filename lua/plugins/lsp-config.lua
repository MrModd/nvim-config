------------------------------
-- LSP servers configuration --
------------------------------

-- Manager of LSP servers: https://github.com/williamboman/mason.nvim
-- Auto configurator for Mason: https://github.com/williamboman/mason-lspconfig.nvim
-- Binding between Nvim and LSP servers: https://github.com/neovim/nvim-lspconfig

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"bashls",
                            "lua_ls",
                            "clangd",
                            "pylsp"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({ -- Bash
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({ -- Lua
        capabilities = capabilities
      })
      lspconfig.clangd.setup({ -- C
        capabilities = capabilities
      })
      lspconfig.pylsp.setup({ -- Python
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = {'W391'},
                maxLineLength = 100
              }
            }
          }
        }
      })
    vim.keymap.set("n", "<C-Space>", vim.lsp.buf.hover, { desc = "nvim-lspconfig: show help of the function" })
    vim.keymap.set("n", "<C-d>", vim.lsp.buf.definition, { desc = "nvim-lspconfig: go to the definition" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "nvim-lspconfig: error resolution" })
    end
  }
}
