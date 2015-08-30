local PLUGIN = {}

PLUGIN.doc = [[
	/help [command]
	Get list of basic information for all commands, or more detailed documentation on a specified command.
]]

PLUGIN.triggers = {
	'^/help',
	'^/h$',
	'^/start$'
}

function PLUGIN.action(msg)

	if string.find(msg.text, '@') and not string.match(msg.text, 'help@'..bot.username) then return end

	local input = get_input(msg.text)

	if input then
		for i,v in ipairs(plugins) do
			if v.doc then
				if '/' .. input == trim_string(first_word(v.doc)) then
					return send_msg(msg, v.doc)
				end
			end
		end
	end

	local message = 'Available commands:\n' .. help_message .. [[
		*Arguments: <required> [optional]
	]]

	return send_msg(msg, message)

end

return PLUGIN
