local PLUGIN = {}

PLUGIN.doc = [[
	/giphy [query]
	Returns a random or search-resulted GIF from giphy.com.
	Want GIFs sent directly to chat? Try @ImageBot.
]]

PLUGIN.triggers = {
	'^/giphy'
}

function PLUGIN.action(msg)

	local search_url = 'http://api.giphy.com/v1/gifs/search?limit=10&api_key=' .. config.giphy_api_key
	local random_url = 'http://tv.giphy.com/v1/gifs/random?api_key=' .. config.giphy_api_key
	local result_url = ''

	search_url = search_url .. '&rating=pg-13&q='
	random_url = random_url .. '&rating=pg-13'

	local input = get_input(msg.text)

	if not input then

		local jstr, res = HTTP.request(random_url)
		if res ~= 200 then
			return send_msg(msg, config.locale.errors.connection)
		end
		local jdat = JSON.decode(jstr)
		result_url = jdat.data.image_url

	else

		local jstr, res = HTTP.request(search_url .. input)
		if res ~= 200 then
			return send_msg(msg, config.locale.errors.connection)
		end
		local jdat = JSON.decode(jstr)
		if #jdat.data == 0 then
			return send_msg(msg, config.locale.errors.results)
		end
		result_url = jdat.data[math.random(#jdat.data)].images.original.url

	end

	send_message(msg.chat.id, result_url, false, msg.message_id)

end

return PLUGIN
