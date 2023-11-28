return {
  "neovim/nvim-lspconfig",
  opts = {
    -- options for vim.diagnostic.config()
    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {
      terraformls = {
        filetypes = { "tf", "terraform", "hcl", "terraform-vars" },
      },
      yamlls = {},
      bashls = {},
      tflint = {},
      gopls = {},
    },
  },
}
