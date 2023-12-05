return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<c-t>"] = require("telescope.actions").select_tab,
        },
      },
    },
  },
}
