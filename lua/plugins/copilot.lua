----------------------------
-- Copilot (AI assistant) --
----------------------------

-- https://github.com/github/copilot.vim
-- Requires Node.js v20+
-- To install, run :Copilot setup

return {
    "github/copilot.vim",
    init = function()
        -- Avoid npx cache/install failures; use the bundled language server
        vim.g.copilot_npx_command = 0
    end,
}
