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

-- local function custom_picker()
--   local projects = get_projects()
--   vim.notify("Total Projects: " .. #projects)
--   snacks.picker.pick({
--     source = "projects",
--     prompt = "Projects> ",
--     items = projects,
--     action = function(item)
--       vim.cmd("cd " .. item.value)
--     end,
--   })
-- end
-- Create a custom picker source
local function custom_picker()
  local projects = get_projects()
  local picker = snacks.picker.pick({
    source = "projects",
    finder = function()
      return projects
    end,
    prompt = "Projects> ",
    format = function(item)
      return {
        value = item.value,
        display = item.label,
        field = item.file,
      }
    end,
    action = function(item)
      -- Logic to switch to the selected project directory
      vim.cmd("cd " .. item.value)
    end,
  })
  return picker
end

-- Keymap to invoke the custom project picker
vim.keymap.set("n", "<leader>sp", custom_picker, { desc = "Show All Projects" })
