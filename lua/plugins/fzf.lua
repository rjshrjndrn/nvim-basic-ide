return {
  "ibhagwan/fzf-lua",
  keys = {
    { "//", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
    { "//", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
    { "??", LazyVim.pick("grep_cword", { root = false }), desc = "Word (Root Dir)" },
    { "??", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (Root Dir)" },
  },
  opts = function(_, opts)
    local config = require("fzf-lua.config")
    -- Refer: https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/defaults.lua
    local file_win_opts = {
      fullscreen = true,
      preview = {
        layout = "vertical",
        vertical = "up:70%",
      },
    }
    config.defaults.actions.files["ctrl-t"] = require("fzf-lua.actions").file_tabedit
    config.defaults.keymap.builtin["<a-f>"] = "toggle-fullscreen"
    config.defaults.keymap.builtin["<c-w>"] = "toggle-preview-wrap"
    config.defaults.keymap.builtin["<c-p>"] = "toggle-preview"
    return {
      defaults = {
        -- formatter = "path.dirname_first",
        formatter = "path.filename_first",
      },
      files = { winopts = file_win_opts },
      oldfiles = { winopts = file_win_opts },
      git = {
        files = {
          winopts = file_win_opts,
        },
      },
    }
  end,
}
