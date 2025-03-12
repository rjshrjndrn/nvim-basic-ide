local project_nvim = require("project_nvim")
local snacks = require("snacks")

-- Function to get project list
local function get_projects()
  local projects = project_nvim.get_recent_projects()
  local project_list = {}
  for _, project in ipairs(projects) do
    local path = project
    local name = vim.fn.fnamemodify(project, ":t")
    table.insert(project_list, {
      label = name,
      value = path,
      file = path, -- Add file property required by snacks.nvim
    })
  end
  return project_list
end

-- Create a custom picker source
local function project_picker(opts)
  local projects = get_projects()
  -- Fix the picker call according to snacks.nvim API
  snacks.picker({
    items = projects,
    prompt = "",
    format_item = function(item)
      if not item or not item.label then
        return ""
      end
      return item.label
    end,
    preview_item = function(item)
      if not item or not item.value then
        return ""
      end
      return "Project Path: " .. item.value
    end,
    on_select = function(item)
      if not item or not item.value then
        return
      end
      -- Logic to switch to the selected project directory
      vim.cmd("cd " .. item.value)
    end,
    live_search = true,
    query = "",
  }, opts)
end

-- Keymap to invoke the custom project picker
vim.keymap.set("n", "<leader>sp", function()
  project_picker()
end, { desc = "Show All Projects" })
