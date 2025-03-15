-- References:
-- snacks.nvim picker : https://github.com/folke/snacks.nvim
-- project.nvim : https://github.com/ahmedkhalf/project.nvim/tree/main
-- reddit: https://www.reddit.com/r/neovim/comments/1i8yy4j/create_a_new_source_directories_for_snackspicker/
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

local function custom_picker()
  local projects = get_projects()
  vim.notify("Total Projects: " .. #projects)
  snacks.picker.projects({
    projects = project_nvim.get_recent_projects(),
    confirm = "picker_files",
  })
end

-- Keymap to invoke the custom project picker
vim.keymap.set("n", "<leader>fp", custom_picker, { desc = "Show All Projects" })
