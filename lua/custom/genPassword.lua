local function genPass()
  local handle = io.popen("openssl rand -hex 10")
  if handle then
    local result = handle:read("*a"):gsub("%s+$", "") -- Read and trim trailing whitespace
    handle:close()
    if result then
      local row, col = unpack(vim.api.nvim_win_get_cursor(0)) -- Get current cursor position
      local line = vim.api.nvim_get_current_line()
      local before = line:sub(1, col)
      local after = line:sub(col + 1)
      vim.api.nvim_set_current_line(before .. result .. after)
      vim.api.nvim_win_set_cursor(0, { row, col + #result }) -- Move cursor to end of inserted text
    end
  end
end

vim.api.nvim_create_user_command("GenPass", genPass, {})
-- Map the function to a keybinding (optional)
-- vim.api.nvim_set_keymap("n", "<leader>gp", ":GenPass<CR>", { noremap = true, silent = true })

return genPass
