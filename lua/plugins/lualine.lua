--------------------------
-- Lualine (status bar) --
--------------------------

-- https://github.com/nvim-lualine/lualine.nvim

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox"
      },
      sections = {
        lualine_c = {{'filename', path=1}},
        lualine_x = {'encoding', 'fileformat', 'filetype', 'lsp_status'},
      }
    })
  end
}
