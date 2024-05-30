return {
  "nvim-cmp",
  dependencies = {
    -- codeium
    {
      "Exafunction/codeium.nvim",
      cmd = "Codeium",
      -- build = ":Codeium Auth",
      opts = {
        enterprise_mode = false,
        enable_chat = false,
      },
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "codeium",
      group_index = 1,
      priority = 10,
    })
  end,
}
