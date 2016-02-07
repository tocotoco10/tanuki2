#
#
#
#
#

cronJob = require('cron').CronJob
request = require 'request'

module.exports = (robot) ->
  new cronJob( '0 45 7 * * *', () =>
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010', (error, res, body) ->
      json = JSON.parse body
      title = json['title']
      todayWeather = json['forecasts'][0]
      article = todayWeather['dateLabel'] + 'の' + title + 'は「' + todayWeather['telop'] + '」ですわぁ。\n' + todayWeather['image']['url']
      robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 45 19 * * *', () =>
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010', (error, res, body) ->
      json = JSON.parse body
      title = json['title']
      tommorowWeather = json['forecasts'][1]
      article = todayWeather['dateLabel'] + 'の' + title + 'は「' + todayWeather['telop'] + '」みたいやで？\n' + todayWeather['image']['url']
      robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

