-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable undo for specific file types (like encrypted files)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.age", "*.gpg", "*.enc", "*.encrypted" },
  callback = function()
    vim.opt_local.undofile = false -- Disable persistent undo
    -- vim.opt_local.undolevels = -1 -- Disable undo completely for the buffer
    vim.opt_local.swapfile = false -- Also good to disable swap for encrypted files
    vim.opt_local.backup = false -- No backup files
    vim.opt_local.writebackup = false -- No backup while writing
  end,
})
