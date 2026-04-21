------------------------------------
-- Telescope (file search & grep) --
------------------------------------

-- https://github.com/nvim-telescope/telescope.nvim
-- Floating box for selection: https://github.com/nvim-telescope/telescope-ui-select.nvim

return {
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = "Telescope: find files within git repo" })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope: find files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope: live grep" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope: buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope: help tags" })
      vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "Telescope: registers" })
      vim.keymap.set("n", "<C-x>", "<Cmd>Telescope keymaps<CR>", { desc = "Telescope: show all keybinds" })

      -- BEGIN: open Telescope in the current file's directory and open the selected file in an horizontal split
      local actions = require("telescope.actions")
      local actions_state = require("telescope.actions.state")
      local function open_fuzzy_in_cwd_vsplit()
        local cwd = vim.fn.expand("%:p:h")
        if cwd == "" or cwd == "." then cwd = vim.loop.cwd() end

        local opts = {
          cwd = cwd,
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
          prompt_title = "Files in: " .. cwd,
          attach_mappings = function(prompt_bufnr, map)
            local open_in_vsplit = function()
              local selection = actions_state.get_selected_entry()
              if not selection then return end
              local target = selection.path or selection.filename or selection.value
              if not target then target = tostring(selection) end
              actions.close(prompt_bufnr)
              vim.cmd("split " .. vim.fn.fnameescape(target))
            end
            map("i", "<CR>", open_in_vsplit)
            map("n", "<CR>", open_in_vsplit)
            return true
          end,
        }

        builtin.find_files(opts)
      end

      vim.api.nvim_create_user_command("TelescopeCwdSplit", open_fuzzy_in_cwd_vsplit, {})
      vim.keymap.set("n", "<leader>t", open_fuzzy_in_cwd_vsplit, { desc = "Telescope: find files in current file's directory and open in split" })
      -- END

    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
