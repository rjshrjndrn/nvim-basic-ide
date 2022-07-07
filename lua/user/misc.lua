-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = false }

-- Ref: https://github.com/nanotee/nvim-lua-guide#vlua
local function clipboardToggle()
  local clipboardValue = vim.api.nvim_get_option('clipboard')
  if (clipboardValue == 'unnamedplus') then
    vim.api.nvim_set_option_value('clipboard', '' ,{scope = 'global'})
    print('clipboard: ')
  else
    vim.api.nvim_set_option_value('clipboard', 'unnamedplus', {scope = 'global'})
    print('clipboard: unnamedplus')
  end
end

keymap("n", "<leader>c",clipboardToggle, opts)
