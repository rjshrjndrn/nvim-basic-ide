local M = {}

function M.encrypt_buffer()
  -- Get current buffer content
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local content = table.concat(lines, "\n")

  -- Encrypt the content using age via stdin with ASCII armor (-a)
  local cmd = "age -e -a -R " .. vim.fn.expand(M.config.public_key_path)
  local encrypted = vim.fn.system(cmd, content)

  -- Check for encryption errors
  if vim.v.shell_error ~= 0 then
    vim.notify("Encryption failed: " .. encrypted, vim.log.levels.ERROR)
    return
  end

  -- Replace buffer content with encrypted data
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(encrypted, "\n"))
  vim.notify("Buffer encrypted with age", vim.log.levels.INFO)
end

function M.decrypt_buffer()
  -- Get the current buffer's file path
  local filepath = vim.fn.expand("%")

  -- Run age decryption command on the file
  local cmd = string.format("age -d -i %s %s", vim.fn.expand(M.config.private_key_path), vim.fn.shellescape(filepath))
  local output = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify("Decryption failed: " .. output, vim.log.levels.ERROR)
    return
  end

  -- Replace buffer content with decrypted output
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))

  vim.notify("Buffer decrypted with age", vim.log.levels.INFO)
end

-- Default configuration
M.config = {
  public_key_path = "~/.cred/age.pub",
  private_key_path = "~/.cred/age.key",
}

-- Function to update configuration
function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", M.config, opts)
end

vim.keymap.set("n", "<leader>ad", M.decrypt_buffer, { desc = "Age Decrypt file" })
vim.keymap.set("n", "<leader>ae", M.encrypt_buffer, { desc = "Age Encrypt file" })
return M
