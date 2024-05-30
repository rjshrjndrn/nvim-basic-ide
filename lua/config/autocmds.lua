-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'Aeril' . tabpagenr() | quit | endif")
vim.api.nvim_exec(
  [[
augroup AnsibleYaml
  autocmd!
  autocmd BufRead,BufNewFile */ansible/* set filetype=yaml.ansible
augroup END
]],
  false
)
