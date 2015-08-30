local PLUGIN = {}

PLUGIN.doc = [[
	/about
	Information about the bot.
]]

PLUGIN.triggers = {
	'^/about',
	'^/info'
}

function PLUGIN.action(msg)

	local message = [[
		Hi! I am ]] .. bot.first_name .. [[: A multipurpose Telegram bot run by the LibreLabUCM association: www.librelabucm.org
		Use /help to see what services I can offer you.
		-----
		Currently in version: ]] .. HAL_VERSION .. [[
		HALIX is FreeSoftware, code can be found here: https://github.com/LibreLabUCM/HALIX9000
		-----
    Based on otouto v]] .. VERSION .. [[ by @topkecleon.
    otouto v2 is licensed under the GPLv2. topkecleon.github.io/otouto
		]] -- Please do not remove this message. (by @topkecleon)

	send_message(msg.chat.id, message, true)

end

return PLUGIN
