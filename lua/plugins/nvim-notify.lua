return {
  "rcarriga/nvim-notify",
  opts = {
    fps = 60,
    timeout = 10,
    render = "wrapped-compact",
    stages = "fade",
    top_down = false,
    max_width = function()
      return math.floor(vim.o.columns * 0.3)
    end,
  },
}
