-- References:
-- snacks.nvim picker : https://github.com/folke/snacks.nvim
-- project.nvim : https://github.com/ahmedkhalf/project.nvim/tree/main
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
    prompt = "Projects",
    live = true,
    -- query = opts and opts.query or "",
    -- on_select = function(item)
    --   if item and type(item.value) == "string" then
    --     vim.cmd("cd " .. item.value)
    --   end
    -- end,
  }, opts)
end

-- Keymap to invoke the custom project picker
vim.keymap.set("n", "<leader>sp", function()
  project_picker()
end, { desc = "Show All Projects" })
