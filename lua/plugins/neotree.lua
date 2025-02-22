------------------------------------
-- Neotree (show filesystem tree) --
------------------------------------

-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        }
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        }
      },
      window = {
        mappings = {
          ["p"] = {
            "toggle_preview",
            config = {
              use_float = true,
              -- use_image_nvim = true,
              title = 'Neo-tree Preview',
            },
          },
        }
      }
    })
    vim.keymap.set("n", "<F1>", "<Cmd>Neotree reveal toggle<CR>", { desc = "Neotree: show filesystem tree" })
    vim.keymap.set("n", "<F2>", "<Cmd>Neotree buffers reveal toggle<CR>", { desc = "Neotree: show buffers" })
  end
}
