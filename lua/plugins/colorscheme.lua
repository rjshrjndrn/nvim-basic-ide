local colorscheme = {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      -- transparent = true,
      style = "night",
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    transparent = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "terafox",
    },
  },
}
return colorscheme
