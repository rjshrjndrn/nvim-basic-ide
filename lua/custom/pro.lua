-- References:
-- snacks.nvim picker : https://github.com/folke/snacks.nvim
-- project.nvim : https://github.com/ahmedkhalf/project.nvim/tree/main
-- reddit: https://www.reddit.com/r/neovim/comments/1i8yy4j/create_a_new_source_directories_for_snackspicker/
local project_nvim = require("project_nvim")
local snacks = require("snacks")

-- Function to get project list
local function get_projects()
  snacks.picker.projects({
    projects = project_nvim.get_recent_projects(),
    confirm = "picker_files",
  })
end
-- Keymap to invoke the custom project picker
vim.keymap.set("n", "<leader>fp", get_projects, { desc = "Show All Projects" })
