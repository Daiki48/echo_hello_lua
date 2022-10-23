local echo_name = require(echo_hello_lua.echo_name)

local echo_hello_lua = {}

local function with_defaults(options)
	return {
		name = options.name or "Daiki"
	}
end

function echo_hello_lua(options)
	echo_hello_lua.options = with_defaults(options)
	vim.api.nvim_create_user_command("HelloLuaPlugin", echo_hello_lua.hello_lua_plugin, {})
end

function echo_hello_lua.configured()
	return echo_hello_lua.options ~= nil
end

function echo_hello_lua.hello_lua_plugin()
	if not echo_hello_lua.configured() then
		return
	end

	local greeting = echo_name.greeting(echo_hello_lua.options.name)
	print(greeting)
end

function echo_hello_lua.generic_greet()
	print("Hello, unnamed friend!!")
end

echo_hello_lua.options = nil
return echo_hello_lua
