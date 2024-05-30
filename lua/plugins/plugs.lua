local M = {
  { "tpope/vim-unimpaired", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  -- { "junegunn/fzf", lazy = false },
  -- { "junegunn/fzf.vim", lazy = false },
  { "junegunn/vim-easy-align", lazy = false },
  { "towolf/vim-helm", lazy = false },
  { "junegunn/vim-easy-align", lazy = false },
  -- { "fatih/vim-go", ft = "go", lazy = false },
  { "wincent/ferret", lazy = false },
  {
    "christoomey/vim-tmux-navigator",
    event = "BufReadPre",
    lazy = false,
  },
}

return M
