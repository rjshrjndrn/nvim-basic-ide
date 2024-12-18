return {
  "neovim/nvim-lspconfig",
  opts = {
    -- options for vim.diagnostic.config()
    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {
      terraformls = {
        filetypes = { "tf", "terraform", "terraform-vars" },
      },
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              compositeLiteralTypes = false,
              constantValues = false,
              functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
            usePlaceholders = true,
          },
        },
      },
      helm_ls = {
        -- filetypes = { "helm" },
        -- root_dir = require("lspconfig").util.root_pattern("Chart.yaml"),
      },
      yamlls = {
        filetypes = { "yml", "yaml" },
        -- lazy-load schemastore when needed
        on_new_config = function(new_config)
          new_config.settings.yaml.schemas =
            vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
        end,
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = {
              enable = false,
            },
            validate = true,
            schemaStore = {
              -- Must disable built-in schemaStore support to use
              -- schemas from SchemaStore.nvim plugin
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
            schemas = {
              -- ref: https://github.com/steeef/dotfiles/pull/5/files
              -- TODO: load based on kind:
              ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "*argo/*application/*.yaml",
              ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/applicationset_v1alpha1.json"] = "*argo/*appset/*.yaml",
              ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/appproject_v1alpha1.json"] = "*project/*.yaml",
            },
          },
        },
      },
      bashls = {
        filetypes = { "sh", "bash" },
      },
      tflint = {},
      pyright = {},
      jsonls = {},
      ansiblels = {
        filetypes = { "yaml.ansible" },
      },
    },
    setup = {
      yamlls = function(server, opts)
        opts.on_attach = function(client, bufnr)
          -- Debug: Open /tmp/file in append mode
          -- -- Get the filetype of the current buffer
          -- local filetype = vim.bo[bufnr].filetype
          -- local filename = vim.api.nvim_buf_get_name(bufnr)
          -- local file = io.open("/tmp/file", "a")
          -- if file then
          --   -- Write buffer number and filetype to the file
          --   file:write(
          --     "Buffer Number: " .. bufnr .. ", Filetype: " .. filetype .. "\n",
          --     "FileName: " .. filename .. "\n"
          --   )
          --   -- Close the file
          --   file:close()
          -- end

          -- Disable diagnostics for Helm file types
          -- if vim.bo[bufnr].filetype == "helm" then
          vim.diagnostic.disable(bufnr)
          -- end
        end
        require("lspconfig")[server].setup(opts)
      end,
    },
  },
}
