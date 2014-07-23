# Description:
#   Get a random excuse from Coding Excuses
#
# Dependencies:
#   "request": "^2.38.0"
#
# Commands:
#   hubot excuse - Pulls a random excuse from http://codingexcuses.com
#
# Author:
#   jonursenbach

request = require 'request'

module.exports = (robot) =>
  robot.respond /excuse/i, (msg) ->
    options = {
      url: 'http://www.codingexcuses.com',
      headers: {
        'Accept': 'application/json'
      }
    }

    request options, (err, res, body) =>
      return msg.send "Can't excuse you. ERROR: #{err}" if err
      return msg.send "Can't excuse you. ERROR: #{res.statusCode + ':\n' + body}" if res.statusCode != 200

      body = JSON.parse(body);

      return msg.send body.excuse
