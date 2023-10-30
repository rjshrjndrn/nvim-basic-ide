local M = {
  { "vimwiki/vimwiki", ft = { "vimwiki" }, cmd = "VimwikiIndex",
    keys = {
        { "<leader>ww", desc = "vimwiki index" },
        { "<leader>w<leader>w", desc = "generate git message" },
    },
    lazy = true},
}

vim.g.vimwiki_markdown_link_ext = 1
vim.g.taskwiki_markup_syntax = "markdown"
vim.g.markdown_folding = 1

vim.g.vimwiki_list = {
  { path = "~/vimwiki/",          syntax = "markdown", ext = ".md" },
  { path = "~/vimwiki_personal/", syntax = "markdown", ext = ".md" },
}
vim.g.vimwiki_ext2syntax =
{ [".md"] = "markdown",[".mkd"] = "markdown",[".wiki"] = "media",[".markdown"] = "markdown" }
vim.g.vimwiki_folding = ""
vim.g.vimwiki_listsyms = " ○◐●✓"

return M
