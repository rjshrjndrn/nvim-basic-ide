return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.dashboard = { enabled = false }
    opts.scratch = {
      ft = "markdown",
      cmd = "Scratch",
      name = "Scratch",
    }
    local t_picker = {}
    if LazyVim.has("trouble.nvim") then
      t_picker = {
        actions = {
          trouble_open = function(...)
            return require("trouble.sources.snacks").actions.trouble_open.action(...)
          end,
        },
        keys = {
          ["<a-t>"] = {
            "trouble_open",
            mode = { "n", "i" },
          },
        },
      }
    end
    local gitbrowse = require("snacks.gitbrowse")
    return vim.tbl_deep_extend("force", opts or {}, t_picker, {
      picker = {
        sources = {
          git_log = {
            win = {
              input = {
                keys = {
                  ["gb"] = {
                    "git_browse",
                    mode = { "n" },
                  },
                },
              },
            },
          },
        },
        actions = {
          git_browse = function(picker, item)
            -- return Snacks.gitbrowse()
            -- picker:close()
            -- vim.notify(vim.inspect(item), vim.log.levels.INFO)
            -- return Snacks.gitbrowse()
            gitbrowse.open({ what = "commit", commit = item.commit })
          end,
        },
        win = {
          input = {
            keys = {
              ["<c-x>"] = {
                "cycle_win",
                mode = { "n", "i" },
              },
            },
          },
        },
      },
    })
  end,
}
