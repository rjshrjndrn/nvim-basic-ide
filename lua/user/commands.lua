-- help: nvim_create_user_command()
vim.api.nvim_create_user_command("Formatter", function()
	vim.lsp.buf.format()
end, {})
-- help: nvim_buf_create_user_command()
-- vim.api.nvim_buf_create_user_command(
--   0,'Format', 'lua vim.lsp.buf.format()', {}
-- )
vim.api.nvim_create_user_command("Upper", "echo toupper(<q-args>)", { nargs = 1 })
-- :command! -nargs=1 Upper echo toupper(<q-args>)
