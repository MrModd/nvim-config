--------------------------------
-- Fugitive (Git integration) --
--------------------------------

-- https://github.com/tpope/vim-fugitive

return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>b", "<Cmd>Git blame<CR>", { desc = "Fugitive: open git blame on the left of the screen" })
  end
}
