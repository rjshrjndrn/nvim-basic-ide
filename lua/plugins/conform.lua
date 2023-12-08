return {
  "stevearc/conform.nvim",
  -- Ref: https://github.com/stevearc/conform.nvim/issues/201#issuecomment-1813007081
  opts = {
    -- Format bash using space rather than tab
    formatters = {
      shfmt_i = { command = "shfmt", args = { "-i", "4" } },
    },
    formatters_by_ft = {
      sh = { "shfmt_i" },
    },
  },
}
