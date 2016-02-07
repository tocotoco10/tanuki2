# Description
#   毎朝の天気通知
#
# Dependencies:
#
#
# Commands:
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = ""

module.exports = (robot) ->
  new cronJob( '0 20 14 * * *', () =>
    url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=140010"
    options =
      url: url
      timeout: 2000
    request options, (error, response, body) ->
      forecastInfo = JSON.parse body
      day = 0
      title     = forecastInfo['title']
      link      = forecastInfo['link']
			text      = forecastInfo['description']['text']
			weather   = forecastInfo['forecasts'][day]
      forecast  = "<#{weather['date']}の#{title}>は「#{weather['telop']}」です。"
      robot.send {room:"test"}, forecast, null, true, "Asia/Tokyo" 
  ).start()
