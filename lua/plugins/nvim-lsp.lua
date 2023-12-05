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
      helm_ls = {
        filetypes = { "helm" },
      },
      yamlls = {
        filetypes = { "yml", "yaml", "helm" },
      },
      bashls = {
        filetypes = { "sh", "bash" },
      },
      tflint = {},
      gopls = {},
      pyright = {},
      jsonls = {},
    },
    setup = {
      yamlls = function(server, opts)
        opts.on_attach = function(client, bufnr)
          -- Disable diagnostics for Helm file types
          if vim.bo[bufnr].filetype == "helm" then
            vim.diagnostic.disable(bufnr)
          end
        end
        require("lspconfig")[server].setup(opts)
      end,
    },
  },
}
