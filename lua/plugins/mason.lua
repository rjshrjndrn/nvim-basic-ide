return {
  { "mason-org/mason.nvim", version = "1.11.0" },
  { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
  {
    "williamboman/mason.nvim",
    ensure_installed = {
      "stylua",
      "shfmt",
      "helm_ls",
      "hcl",
      "gopls",
    },
  },
}
