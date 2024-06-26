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
    config.defaults.actions.files["ctrl-t"] = require("fzf-lua.actions").file_tabedit
    config.defaults.keymap.builtin["<a-f>"] = "toggle-fullscreen"
    config.defaults.keymap.builtin["<c-w>"] = "toggle-preview-wrap"
    config.defaults.keymap.builtin["<c-p>"] = "toggle-preview"
    opts.winopts = {
      preview = {
        layout = "vertical",
        vertical = "up:70%",
      },
    }
  end,
}
