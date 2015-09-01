# HALIX 9000
[![License](http://img.shields.io/:license-gpl-blue.svg?style=flat)](http://opensource.org/licenses/GPL-2.0)

A multipurpose Telegram bot run by the [LibreLabUCM](https://github.com/LibreLabUCM) association. Services are provided in separated plugins.

<!--You can contact it trough its username [@Halix9000Bot](http://telegram.me/Halix9000Bot).-->

It's based on [mokubot](https://github.com/topkecleon/otouto) which, in turn, is based on the old [telegram-bot repo](https://github.com/yagop/telegram-bot/).

## Enabled Bot Commands

<table>
  <thead>
    <tr>
      <td>8ball.lua</td>
      <td>/8ball</td>
      <td>Magic 8-ball</td>
    </tr>
    <tr>
      <td>about.lua</td>
      <td>/about</td>
      <td>Information about the bot</td>
    </tr>
    <tr>
      <td>calc.lua</td>
      <td>/calc &lt;expression&gt;</td>
      <td>Solve math expression and convert units</td>
    </tr>
    <tr>
      <td>currency.lua</td>
      <td>/cash &lt;from&gt; &lt;to&gt; [amount]</td>
      <td>Convert an amount from one currency to another.</td>
    </tr>
    <tr>
      <td>dice.lua</td>
      <td>/roll [arg]</td>
      <td>Roll a die. Accepts D&amp;D notation</td>
    </tr>
    <tr>
      <td>echo.lua</td>
      <td>/echo &lt;text&gt;</td>
      <td>Repeat a string</td>
    </tr>
    <tr>
      <td>fortune.lua</td>
      <td>/fortune</td>
      <td>Random fortunes</td>
    </tr>
    <tr>
      <td>gImages.lua</td>
      <td>/images &lt;query&gt;</td>
      <td>Google Images search</td>
    </tr>
    <tr>
      <td>gMaps.lua</td>
      <td>/loc &lt;location&gt;</td>
      <td>Google Maps search</td>
    </tr>
    <tr>
      <td>gSearch.lua</td>
      <td>/google &lt;query&gt;</td>
      <td>Google Search</td>
    </tr>
    <tr>
      <td>giphy.lua</td>
      <td>/giphy [query]</td>
      <td>Giphy search or random</td>
    </tr>
    <tr>
      <td>hackernews.lua</td>
      <td>/hackernews</td>
      <td>Top stories from Hackernews</td>
    </tr>
    <tr>
      <td>help.lua</td>
      <td>/help [command]</td>
      <td>List commands</td>
    </tr>
    <tr>
      <td>hex.lua</td>
      <td>/hex &lt;number&gt;</td>
      <td>Convert to and from hexadecimal</td>
    </tr>
    <tr>
      <td>imdb.lua</td>
      <td>/imdb &lt;movie | TV series&gt;</td>
      <td>IMDb movie/television info</td>
    </tr>
    <tr>
      <td>reddit.lua</td>
      <td>/reddit [r/subreddit | query]</td>
      <td>Posts from reddit</td>
    </tr>
    <tr>
      <td>weather.lua</td>
      <td>/weather &lt;location&gt;</td>
      <td>Get the weather for a place</td>
    </tr>
    <tr>
      <td>remind.lua</td>
      <td>/remind &lt;delay&gt; &lt;message&gt;</td>
      <td>Set a reminder for yourself or a group</td>
    </tr>
    <tr>
      <td>time.lua</td>
      <td>/time &lt;location&gt;</td>
      <td>Get the time for a place</td>
    </tr>
    <tr>
      <td>whoami.lua</td>
      <td>/who</td>
      <td>Get user and group IDs</td>
    </tr>
    <tr>
      <td>wiki.lua</td>
      <td>/wiki</td>
      <td>Search Wikipedia for a relevant article and return its summary</td>
    </tr>
    <tr>
      <td>xkcd.lua</td>
      <td>/xkcd [search]</td>
      <td>xkcd strips and alt text</td>
    </tr>
  </tbody>
</table>

<!--
##Setup

Requires Lua, lua-socket and lua-sec. [dkjson](http://github.com/LuaDist/dkjson/) is provided. Written for Lua 5.2 but will probably run on 5.3.

You must have a Telegram bot and auth token from the [BotFather](http://telegram.me/botfather) to run this bot. telegram-cli is not required.

###Configuration

To begin, copy config.lua.default to config.lua and add the relevant information.

Most config.lua entries are self-explanatory.

Add your bot API key, and other API keys if desirable.
The plugins which require API keys that are not provided are disabled by default.
The provided Giphy key is the public test key, and is subject to rate limitaton.

The "fortune.lua" plugin requires the fortune program to be installed on the host computer.

"time_offset" is the time difference, in seconds, between your system clock. It is sometimes necessary for accurate output of the time plugin.

"admins" table includes the ID numbers, as integers, of any privileged users. These will have access to the admin plugin and any addition privileged commands.

"people" table is for the personality plugin:
`["55994550"] = "topkecleon"`

ID number must be a string. The second string is the nickname to be given to the identified user when a personality greeting is triggered.

To run:

`lua bot.lua`

-->

##Support

Just use the github capabilities. We're working on a better support service directly built into the bot.

##Thanks
Thanks to [yagop](https://github.com/yagop/) for starting [telegram-bot](https://github.com/yagop/telegram-bot), the seed of this project, and to all the contributors to that project, [even someone from our association](https://github.com/yagop/telegram-bot/commits?author=DevPGSV).

Futhermore, thanks to [mokubot](https://github.com/topkecleon/otouto) for porting telegram-bot to the new [API Telegram bot](https://core.telegram.org/bots).

![Lua logo](http://www.lua.org/images/powered-by-lua.gif)
