------------------------------
-- LSP servers configuration --
------------------------------

-- Manager of LSP servers: https://github.com/mason-org/mason.nvim
-- Auto configurator for Mason: https://github.com/mason-org/mason-lspconfig.nvim
-- Binding between Nvim and LSP servers: https://github.com/neovim/nvim-lspconfig
-- Mason tool installer: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {border = "none"}
      })
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local caps = require("cmp_nvim_lsp").default_capabilities()

      -- Bash
      vim.lsp.config("bashls", { capabilities = caps })
      -- Lua
      vim.lsp.config("lua_ls", { capabilities = caps })
      -- C/C++
      vim.lsp.config("clangd", { capabilities = caps })
      -- Python
      vim.lsp.config("pylsp", {
        capabilities = caps,
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

      require("mason-lspconfig").setup({
        ensure_installed = {"bashls", -- Installed through npm
                            "lua_ls",
                            "clangd", -- Not compatible with aarch64
                            "pylsp",
        }
	-- automatic_enable = true (default)
      })

    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      vim.keymap.set("n", "<C-Space>", vim.lsp.buf.hover, { desc = "nvim-lspconfig: show help of the function" })
      vim.keymap.set("n", "<C-d>", vim.lsp.buf.definition, { desc = "nvim-lspconfig: go to the definition" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "nvim-lspconfig: error resolution" })
    end,
  },
  -- mason-tool-installer (tools only; lspconfig integration OFF)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "stylua", "shellcheck", "shfmt" },
        integrations = { ["mason-lspconfig"] = false },
        run_on_start = true,
      })
    end,
  },
}
