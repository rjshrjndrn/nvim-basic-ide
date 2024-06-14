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
        -- filetypes = { "helm" },
        -- root_dir = require("lspconfig").util.root_pattern("Chart.yaml"),
      },
      yamlls = {
        filetypes = { "yml", "yaml" },
        -- Have to add this for yamlls to understand that we support line folding
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
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
              enable = true,
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
              ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "*argo/*.yaml",
            },
          },
        },
      },
      bashls = {
        filetypes = { "sh", "bash" },
      },
      tflint = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            -- hints = {
            -- assignVariableTypes = true,
            -- compositeLiteralFields = true,
            -- compositeLiteralTypes = true,
            -- constantValues = true,
            -- functionTypeParameters = true,
            -- parameterNames = true,
            -- rangeVariableTypes = true,
            -- },
            analyses = {
              fieldalignment = true,
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
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
