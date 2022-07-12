-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = false }

-- Ref: https://github.com/nanotee/nvim-lua-guide#vlua
local function clipboardToggle()
    vim.api.nvim_set_option_value('clipboard', 'unnamedplus' ,{scope = 'global'})
    local timer = vim.loop.new_timer()
    print('clipboard: unnamedplus')
    -- Wait for 1s and revert to the old clipboard
    -- :help timer_start
    timer:start(1000,0, vim.schedule_wrap(function ()
      -- TODO: Have to check how to automatically, revert if a key is pressed
      vim.api.nvim_set_option_value('clipboard', '' ,{scope = 'global'})
      print('clipboard: ')
    end
    ))
    -- -- print('clipboard: ')
end

keymap("n", "<leader>c",clipboardToggle, opts)
keymap("v", "<leader>c",clipboardToggle, opts)


