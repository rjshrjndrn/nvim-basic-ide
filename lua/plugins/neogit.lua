return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
    "echasnovski/mini.pick", -- optional
  },
  config = function(_, opts)
    require("neogit").setup({
      kind = "split", -- Set to "split" or "floating"
      integrations = {
        diffview = false, -- Enable if using diffview.nvim
      },
      disable_commit_confirmation = true,
      -- Custom floating window configuration
      window = {
        position = "float",
        width = 0.8, -- Adjust width (0.8 is 80% of the screen width)
        height = 0.8, -- Adjust height (0.8 is 80% of the screen height)
      },
    })
  end,
  keys = {
    { "<leader>gs", ":Neogit<CR>", desc = "Git Status", silent = true },
    { "<leader>gp", ":Neogit pull<CR>", desc = "Git Pull", silent = true },
    { "<leader>gP", ":Neogit push<CR>", desc = "Git Push", silent = true },
  },
}
