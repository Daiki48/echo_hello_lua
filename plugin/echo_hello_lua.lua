if vim.fn.has("nvim-0.7.0") == 0 then
	vim.api.nvim_err_writeln("echo_hello_lua requires at least nvim-0.7.0.1")
	return
end

if vim.g.loaded_echo_hello_lua == 1 then
	return
end
vim.g.loaded_echo_hello_lua = 1

local echo_hello_lua = require("echo_hello_lua")

vim.api.nvim_create_user_command(
	"HelloLuaPlugin",
	echo_hello_lua.hello_lua_plugin,
	{}
)
