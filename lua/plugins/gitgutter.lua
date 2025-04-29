------------------------------------------------
-- Gitgutter (show changed lines on the left) --
------------------------------------------------

-- https://github.com/airblade/vim-gitgutter

return {
  "airblade/vim-gitgutter",
  config = function()
    vim.keymap.set('n', '<F7>', function()
      local word = vim.fn.expand('<cword>')
      vim.cmd('Git grep ' .. vim.fn.shellescape(word))
    end, { desc = "Git grep the word under cursor" })
  end
}
