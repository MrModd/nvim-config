----------------------------------------------------
-- Local-Highlight (highlight words under cursor) --
----------------------------------------------------

-- https://github.com/tzachar/local-highlight.nvim

return {
  "tzachar/local-highlight.nvim",
  commit = "280b1b916183f373f340e8d2391cfda5c361f619", -- It's dangerous to update, the devs are very buggy
  config = function()
    require('local-highlight').setup({
      file_types = nil, -- If this is given only attach to this
      -- OR attach to every filetype except:
      disable_file_types = nil,
      hlgroup = 'Search',
      cw_hlgroup = 'all',
      -- Whether to display highlights in INSERT mode or not
      insert_mode = true,
      min_match_len = 1,
      max_match_len = math.huge,
      highlight_single_match = false,
    })
  end
}
