--------------------------------------------
-- Floatty (show float terminal with cmd) --
--------------------------------------------

-- https://github.com/ingur/floatty.nvim

return {
  "ingur/floatty.nvim",
  lazy = false, -- load at startup so codex can be spawned anytime
  config = function()
    local terminal = require("floatty").setup({
      width = 0.9,
      height = 0.9,
      border = "rounded",
      cmd = vim.o.shell,  -- Replace with the command of choice
    })

    vim.keymap.set("n", "<F8>", function() terminal.toggle() end, { desc = "Floatty: persistent float terminal" })
    vim.keymap.set("t", "<F8>", function() terminal.toggle() end, { desc = "Floatty: persistent float terminal" })
  end,
}
