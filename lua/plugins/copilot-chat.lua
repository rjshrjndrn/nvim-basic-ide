return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    model = "claude-3.7-sonnet",
    prompts = {
      Explain = "Write an comprehensive explanation for the selected code.",
    },
    sticky = {
      "#filenames",
      "#buffer",
    },
    mappings = {
      reset = {
        normal = "<C-r>",
        insert = "<C-r>",
      },
    },
  },
}
