return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>gs", false },
    { "<leader>gc", false },
  },
  --   Example of how it works:
  -- ```lua
  -- opts = function(_, opts)
  --   -- opts contains any default/existing options
  --   -- modify the opts
  --   opts.new_setting = "value"
  --   -- the modified opts will be used to configure the plugin
  --   return opts
  -- end
  -- ```
  opts = function(_, opts)
    local config = require("fzf-lua.config")
    local actions = require("fzf-lua.actions")

    -- Refer: https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/defaults.lua
    local file_win_opts = {
      fullscreen = false,
      preview = {
        hidden = "hidden",
      },
    }

    config.defaults.actions.files["ctrl-t"] = actions.file_tabedit
    config.defaults.keymap.builtin["<c-w>"] = "toggle-preview-wrap"
    config.defaults.keymap.builtin["<c-p>"] = "toggle-preview"
    config.defaults.keymap.builtin["<c-o>"] = "toggle-help"

    -- Set global default preview to hidden
    config.defaults.winopts = vim.tbl_deep_extend("force", config.defaults.winopts, file_win_opts)

    -- Apply hidden preview to specific commands
    opts.oldfiles = vim.tbl_deep_extend("force", opts.oldfiles or {}, { winopts = file_win_opts })
    opts.buffers = vim.tbl_deep_extend("force", opts.buffers or {}, { winopts = file_win_opts })
    opts.git = vim.tbl_deep_extend("force", opts.git or {}, {
      files = vim.tbl_deep_extend("force", opts.git and opts.git.files or {}, { winopts = file_win_opts }),
    })
  end,
}
