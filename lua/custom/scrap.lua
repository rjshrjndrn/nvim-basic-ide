-- ~/.config/nvim/lua/custom/scrap.lua

local function scrap()
  local buf_name = "/tmp/scrap.txt"
  local existing_window = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_name(buf) == buf_name then
      existing_window = win
      break
    end
  end

  if existing_window then
    -- If buffer is already open, close the window containing it
    vim.api.nvim_win_close(existing_window, true)
  else
    -- If buffer is not open, open a vertical split
    vim.cmd("vsplit")
    local buf = vim.api.nvim_create_buf(false, true) -- create an unnamed buffer
    vim.api.nvim_buf_set_name(buf, buf_name)
    vim.bo[buf].bufhidden = "wipe" -- set bufhidden option using vim.bo
    vim.api.nvim_win_set_buf(0, buf) -- set the buffer to the current window

    -- Resize the vertical split to 1/4 of the screen width
    local width = math.floor(vim.o.columns * 0.25)
    vim.cmd("vertical resize " .. width)

    -- Read the content of /tmp/scrap.txt and set it to the buffer
    local file = io.open(buf_name, "r")
    if file then
      local content = file:read("*a")
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
      file:close()
    end

    -- Function to write buffer content to /tmp/scrap.txt
    local function write_to_file()
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local content = table.concat(lines, "\n")
      local write_file = io.open(buf_name, "w")
      if write_file then
        write_file:write(content)
        write_file:close()
      end
    end

    -- Set autocommands to save the buffer back to /tmp/scrap.txt
    vim.api.nvim_create_autocmd({ "BufWriteCmd", "InsertLeave", "TextChanged" }, {
      buffer = buf,
      callback = write_to_file,
    })
  end
end

-- Create the command :Scrap to call the scrap function
vim.api.nvim_create_user_command("Scrap", scrap, {})

-- Set the keymap for normal mode to trigger the scrap function
vim.api.nvim_set_keymap("n", "<leader>;", ":Scrap<CR>", { noremap = true, silent = true })

return {
  scrap = scrap,
}
