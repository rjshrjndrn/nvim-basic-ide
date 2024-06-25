return {
  "ibhagwan/fzf-lua",
  keys = {
    { "//", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
    { "//", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
  },
  opts = function(_, opts)
    local config = require("fzf-lua.config")
    config.defaults.actions.files["ctrl-t"] = require("fzf-lua.actions").file_tabedit
  end,
}
