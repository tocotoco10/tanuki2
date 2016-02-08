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

  new cronJob( '0 49 22 * * *', () =>
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010', (error, res, body) ->
      json = JSON.parse body
      title = json['title']
      tommorowWeather = json['forecasts'][1]
      article = tommorowWeather['dateLabel'] + 'の' + title + 'は\n    '
      article += tommorowWeather['telop'] + '\n    '
      article += '最高気温：' + tommorowWeather['temperature']['max']['celsius'] + '℃\n'
      article += tommorowWeather['image']['url']
      robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

