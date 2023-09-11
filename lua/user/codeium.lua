local M = {
    "rjshrjndrn/codeium.nvim",
    -- commit = "2486e4945f2210546c6d51d0bf60a0350bacd406",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
    lazy = false,
}
return M
