#
#
#
#
#

cronJob = require('cron').CronJob
request = require 'request'

module.exports = (robot) ->
  new cronJob( '0 24 23 * * *', () =>
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=130010', (error, res, body) ->
      json = JSON.parse body
      todayWeather = json['forecasts'][0]
      article = todayWeather['dateLabel'] + 'の天気は' + todayWeather['telop'] + 'です\n' + todayWeather['image']['url']
      robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

