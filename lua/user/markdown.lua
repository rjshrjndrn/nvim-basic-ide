return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  lazy = true
}
