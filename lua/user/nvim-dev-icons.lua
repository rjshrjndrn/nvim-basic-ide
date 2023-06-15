local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  -- commit = "e283ab937e0197b37ec5d8013e49495193407324"
  branch = "master",
}

function M.config()
  require("nvim-web-devicons").setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
    },
    color_icons = true,
    default = true,
     override_by_extension = {
      ["txt"] = {
        icon = "",
        color = "#81e043",
        name = "Text"
      }
     };
  }
end

return M
