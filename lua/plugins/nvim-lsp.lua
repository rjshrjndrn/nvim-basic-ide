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
      yamlls = {
        filetypes = { "yml", "yaml", "helm" },
      },
      bashls = {},
      tflint = {},
      gopls = {},
      pyright = {},
      jsonls = {},
      helm_ls = {},
    },
  },
}
