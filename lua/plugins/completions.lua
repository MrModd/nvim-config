----------------------------------
-- Autocomplete functionalities --
----------------------------------

-- Autocomplete engine: https://github.com/hrsh7th/nvim-cmp
-- Snipped engine for LUA: https://github.com/L3MON4D3/LuaSnip
-- Completion source for LuaSnip: https://github.com/saadparwaiz1/cmp_luasnip
-- Provider of snippets: https://github.com/rafamadriz/friendly-snippets
-- Connection to the LSP servers: hrsh7th/cmp-nvim-lsp

return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
	},
    config = function()
      local cmp = require('cmp')
      require("luasnip.loaders.from_snipmate").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'luasnip' }, -- For some reasons it doesn't work
        }, {
          { name = 'buffer' },
        }),
      })
    end
  },
}
