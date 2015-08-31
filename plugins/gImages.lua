local PLUGIN = {}

PLUGIN.doc = [[
	/images <query> or /img <query> or just /i <query>
	This command performs a Google Images search for the given query. One random top result is returned. Safe search is enabled by default.
	Want images sent directly to chat? Try @ImageBot.
]]

PLUGIN.triggers = {
	'^/images?',
	'^/img',
	'^/i '
}

PLUGIN.exts = {
	'.png$',
	'.jpg$',
	'.jpeg$',
	'.jpe$',
	'.gif$'
}

function PLUGIN.action(msg)

	local url = 'https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&safe=active'

	local input = get_input(msg.text)
	if not input then
		if msg.reply_to_message then
			msg = msg.reply_to_message
			input = msg.text
		else
			return send_msg(msg, PLUGIN.doc)
		end
	end

	url = url .. '&q=' .. URL.escape(input)

	local jstr, res = HTTPS.request(url)

	if res ~= 200 then
		send_msg(msg, config.locale.errors.connection)
		return
	end

	local jdat = JSON.decode(jstr)

	if #jdat.responseData.results < 1 then
		send_msg(msg, config.locale.errors.results)
		return
	end

	local is_real = false
	local counter = 0
	while is_real == false do
		counter = counter + 1
		if counter > 5 then
			return send_msg(msg, config.locale.errors.results)
		end
		local i = math.random(#jdat.responseData.results)
		result_url = jdat.responseData.results[i].url
		for i,v in pairs(PLUGIN.exts) do
			if string.match(string.lower(result_url), v) then
				is_real = true
			end
		end
	end

	send_message(msg.chat.id, result_url, false, msg.message_id)

end

return PLUGIN
