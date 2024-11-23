return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>gs", false },
    --   { "//", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
    --   { "//", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
    --   { "??", LazyVim.pick("grep_cword", { root = false }), desc = "Word (CW Dir)" },
    --   { "??", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (CW Dir)" },
  },
  opts = function(_, opts)
    local config = require("fzf-lua.config")
    local actions = require("fzf-lua.actions")
    --   -- Refer: https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/defaults.lua
    --   local file_win_opts = {
    --     fullscreen = false,
    --     preview = {
    --       layout = "vertical",
    --       vertical = "up:70%",
    --     },
    --   }
    config.defaults.actions.files["ctrl-t"] = actions.file_tabedit
    --   config.defaults.keymap.builtin["<a-f>"] = "toggle-fullscreen"
    --   config.defaults.keymap.builtin["<c-w>"] = "toggle-preview-wrap"
    --   config.defaults.keymap.builtin["<c-p>"] = "toggle-preview"
    --   opts.files = vim.tbl_deep_extend("force", opts.files, { winopts = file_win_opts })
    --   opts.grep.actions = {
    --     ["alt-g"] = { actions.toggle_ignore },
    --     ["alt-i"] = { actions.toggle_hidden },
    --   }
    --   opts.oldfiles = vim.tbl_deep_extend("force", opts.oldfiles, { winopts = file_win_opts })
    --   opts.buffers = vim.tbl_deep_extend("force", opts.oldfiles, { winopts = file_win_opts })
    --   opts.git.files = vim.tbl_deep_extend("force", opts.git.files, { winopts = file_win_opts })
  end,
}
