-- Adaption from this code: https://github.com/yagop/telegram-bot/blob/master/plugins/rae.lua
local PLUGIN = {}

PLUGIN.doc = [[
  /rae <term>
  Search <term> in Spanish dictionary.
]]

PLUGIN.triggers = {
	'^/rae'
}

function isTermInArray(array, term)
  local i = 1
  while (i<=#array) and (array[i].word ~= term) do
    i = i + 1
  end
  if i <= #array then
    ret = i
  else
    ret = false
  end
  return ret
end

function PLUGIN.action(msg)

  local input = get_input(msg.text)
  if not input then
    if msg.reply_to_message then
      msg = msg.reply_to_message
      input = msg.text
    else
      return send_msg(msg, PLUGIN.doc)
    end
  end
  -- Powered by https://github.com/javierhonduco/dulcinea
  local api = 'http://dulcinea.herokuapp.com/api/?query='
  local url = api .. URL.escape(input)
  local jstr, res = HTTP.request(url)

  if res ~= 200 then
    return send_msg(msg, config.locale.errors.connection)
  end

  local jdat = JSON.decode(jstr)

  if jdat.status == "error" then
    return send_msg(msg, 'Error: ' .. jdat.message)
  end

  local url_id = ''

  -- show only one result when API returns many (preferably the exact word requested)
  while jdat.type == "multiple" do
    index = isTermInArray(jdat.response,input)
    if index then
      url_id = jdat.response[index].id
    else
      url_id = jdat.response[1].id
    end
    url = api .. URL.escape(url_id)
    jstr = HTTP.request(url)
    jdat = JSON.decode(jstr)
  end

  local responses = #jdat.response

  if responses == 0 then
    return send_msg(msg, config.locale.errors.results)
  end

  if (responses > 5) then -- Display max. 5 results
    responses = 5
  end

  local message = ""

  for i = 1, responses, 1 do
    word = jdat.response[i].word
    if word ~= "=>" then
      message = message .. "== " .. word .. " ==\n"
      local meanings = #jdat.response[i].meanings
      if (meanings > 5) then -- Display max. 5 meaning per word
        meanings = 5
      end
      for j = 1, meanings, 1 do
        local meaning = jdat.response[i].meanings[j].meaning
        local meta = jdat.response[i].meanings[j].meta
        if meta==nil then meta = "" end
        message = message .. "   ".. j ..". " .. meta .. " " .. meaning .. "\n"
      end
    end
  end

  send_msg(msg, message)

end

return PLUGIN
