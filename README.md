Ybot
===============

Ybot is a customizable bot which was inspired by GitHub's [Hubot](http://hubot.github.com/). What can you do with `Ybot`:

  * Chat bot with many different [plugins](https://github.com/TAP-Software/ybot-contrib).
  * Bridge between `http` and different chat systems like `irc`, `xmpp` and etc...
  * Notification chat bot. See [@erlnews](https://twitter.com/erlnews) twitter bot.
  * Email bot.
  * Logging (see [lager_ybot_backend](https://github.com/TAP-Software/lager_ybot_backend)).

[![Build Status](https://travis-ci.org/TAP-Software/Ybot.png)](https://travis-ci.org/TAP-Software/Ybot)

TODO
=========

- [x] Get to build on Travis again
  - [x] Fix issue with old repo url in dependency
  - [x] Fix issue with cowlib not compiling
- [x] Get deployed to Heroku for testing
  - [ ] Get it to connect to Slack
  - [ ] Get it to connect to Flowdock
  - [ ] Connect to HTTP
- [x] Update Contributors to front page of README
- [ ] Check on License, appears to be just for Erlang ?
- [ ] Check if dependencies can be update to use [Hex](https://hex.pm)
  - [ ] How to upgrade an OTP app like this?
  - [ ] Are the dependencies available on Hex.pm?
  - [ ] Switch the current setup to pull from Hex.pm
- [ ] Squash all old bugs.
- [ ] Tests? [Buehler? Tests? Bueler?](https://cdn.meme.am/instances/500x/69579426.jpg)
  - [ ] Once base functionality is established wrap with system tests
  - [ ] Work testing from the outside in as things become clearer


Features
=========

  * Ybot's core completely written in Erlang;
  * Simultaneously run any number of bots on different transports;
  * Web interface;
  * Supports plugins in different technology:
    * Python plugins;
    * Ruby plugins;
    * Shell plugins;
    * Perl plugins;
    * Erlang/OTP plugins;
    * Elixir plugins;
    * Scala plugins;
  * Command history with tunable limit;
  * Dynamic search and loading of plugins;
  * Very easily extensible, just put plugin to plugin directory;
  * Supports IRC and IRC via SSL;
  * Supports XMPP and XMPP via ssl;
  * Supports Campfire
  * HTTP interface;
  * HipChat supporting;
  * Flowdock supporting;
  * Twitter supporting;
  * Email supporting;
  * Skype supporting;
  * Talkerapp supporting;
  * Notifications supporting.

Building and Running
=====================

First of all you must get your own Ybot:

```
git clone https://github.com/TAP-Software/Ybot.git
```

Or download the source file archive: [.tar.gz](https://github.com/TAP-Software/Ybot/tarball/master) or [.zip](https://github.com/TAP-Software/Ybot/zipball/master)

After getting source you need to download dependencies and build the source:

```
./rebar get-deps && ./rebar compile
```

Rename configration template `ybot.config.template` to `ybot.config` and edit configuration file and you can run your Ybot copy:

Start Ybot node:
```
./bin/start.sh
```

Connect to Ybot node console:
```
./bin/console.sh
```

Run on heroku
===============

  * Get you ybot and configure it.
  * Download heroku

```
cd Ybot
heroku create your-application-name -s cedar
heroku config:add BUILDPACK_URL=http://github.com/heroku/heroku-buildpack-erlang.git
echo OTP_R15B01 > .preferred_otp_version
git commit "Select R15B01 as preferred OTP version" .preferred_otp_version
git push heroku master
```

Dependencies
=============

  * [lager](https://github.com/basho/lager) - A logging framework for Erlang/OTP.
  * [reloader](https://github.com/bjnortier/reloader) - Mochiweb's reloader.
  * [ibrowse](https://github.com/cmullaparthi/ibrowse) - Erlang http client.
  * [jiffy](https://github.com/davisp/jiffy) - JSON NIFs for Erlang.
  * [cowboy](https://github.com/extend/cowboy) - Small, fast, modular HTTP server written in Erlang.
  * [mimetypes](https://github.com/spawngrid/mimetypes) - Erlang MIME types library.
  * [erlang-oauth](https://github.com/tim/erlang-oauth) - An Erlang OAuth 1.0 implementation.
  * [Skype4Py](https://github.com/awahlig/skype4py) - Platform independent Python wrapper for the Skype API.
  * [gen_smtpc](https://github.com/TAP-Software/gen_smtpc) - Simple erlang smtp client.

Transport
==========

Ybot's basic transport is a network interface. Ybot is a chat bot and he
spends all of his life chatting. Ybot receives chat messages and execute
commands depending on those received messages. At that moment Ybot
supports:

  * IRC (+ssl supporting, +private messages supporting).
  * XMPP MUC (+single user chat supporting, +private messages supporting, +ssl supporting).
  * Campfire.
  * HTTP.
  * HipChat.
  * Flowdock.
  * Skype.
  * Talkerapp.

And also write-only transports:

  * Twitter
  * Channel

Plugins
==========

Ybot is a chat bot and it can execute different commands. Commands are
simple chat messages. For example, a chat session:

```
you: Ybot math 1 + 5
Ybot: Answer: 6
```

Here are a few simple rules for structuring Ybot plugins.

  * You must address messages to the `Ybot`.

  * After addressing the bot you specify the command to be executed, for example `math` or `ping`. Every command consists from one word.

  * After the command you can specify arguments. Ybot sends all arguments in '' and it turns them into one argument.

  * One command = One plugin. Plugins must live in the `plugins` directory.

  * Each plugin must have the correct extension, for example:

    * .py
    * .rb
    * .shell
  * Erlang/OTP plugin - see example memory plugin

Containing Python, Ruby or shell code.

  * The name of the plugin file must be the same name as the command.
    For example if we have a `Ybot ping` command, we must have a plugin
    named `ping.py` or `ping.rb` or `ping.shell`, etc.

  * Plugin can consist of any code but write the results to `STDOUT` in the end.

Example Ybot:

```
Ybot math 3 ^ 2
```

Here Ybot calls the `math` plugin with the argument: '3 ^ 2'

Current plugins
================

  * memory - Simple Key/Value memory.
  * ackbar - show an Admiral Ackbar.
  * chuck - Chuck Norris quotes.
  * decide - Ybot try to help make decisions for you.
  * github_status - Github status state.
  * echo - simple echo plugin.
  * help - Ybot help.
  * ping - Ybot simple ping/pong.
  * math - Ybot calculate math expressions.
  * date - Ybot show date/time.
  * pugme - Ybot pugme service plugin.
  * erl   - Ybot computation of erlang expression using tryerlang.org.
  * today? - Ybot return current day.
  * shorten_url - Ybot url shortener with goo.gl.
  * hacker_news - Ybot download news from https://news.ycombinator.com/
  * wat - Ybot random WAT image
  * check-site - Ybot check site up/down state
  * ruby - Ybot eval simple ruby expression
  * ip - Ybot external ip
  * hacker_help - Ybot search in stackoverflow.
  * translate - use google translate from Ybot.
  * url - url encode/decode plugin.

These are Ybot's core plugins. You can find other plugins at [ybot-contrib](https://github.com/TAP-Software/ybot-contrib) or see at [ybot plugins catalog](http://0xax.github.com/ybot-plugins.html).

Ybot brain REST API
============
Ybot brain allows to persist data using REST API. It is designed to support multiple storage engines, but the default is based on Mnesia.

REST API endpoint: `http://localhost:8090/memories` (port and host is configurable). Currently supported Content Type is `application/json`.

An example JSON memory object:
```json
{
 "id":"88DAF3FFB0419E0A8368036200000553620002B99862000429C1",
 "plugin":"foo",
 "key":"key1",
 "value":"foo1",
 "created":"2013-03-13 23:45:00"
 }
```

Operations using brain API:

Operation       | HTTP Verb | Url                     | Description
----------------|-----------|-------------------------|-------------------------------------------------
Insert new      | POST      | /memories               | Pass memory object without id and created field
Update existing | PUT       | /memories/id            | Pass memory object without id and created field
Remove by id    | DELETE    | /memories/id            | Delete field by id
Get all         | GET       | /memories               | Return all fileds
Get by id       | GET       | /memories/id            | Return field by id
Get by plugin   | GET       | /memories/?plugin=foo   | Return data by plugin name
Get by key      | GET       | /memories/?key=bar      | Return field by key
Get by value    | GET       | /memories/?value=foobar | Return field by value

Contribute
============

Ybot is an open source project under the Erlang public license (see LICENSE file). Issues, questions and patches are welcome.

If you're hacking Ybot core, please, before sending your pull request,
pull and merge Ybot master to avoid conflicts.

  * Fork main ybot repository (https://github.com/TAP-Software/Ybot).
  * Make your changes in your clone of ybot.
  * Test it.
  * Send pull request.

Author
========

Creator of Ybot [@0xAX](https://twitter.com/0xAX).

Thank you all who participated in Ybot development.
Ybot Contributors:

  * Alin Popa @alinpopa
  * Martin Wiso @tgrk
  * James Turnbull @jamtur01
  * Jonn Mostovoy @manpages
  * Carlo Bertoldi @cbertoldi
  * Andreas Stenius @kaos
  * Tim McGilchrist @tmcgilchrist
  * Eduardo Gurgel @edgurgel
