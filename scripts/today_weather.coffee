#
#
#
#
#

cronJob = require('cron').CronJob
request = require 'request'

module.exports = (robot) ->
  new cronJob( '0 42 23 * * *', () =>
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010', (error, res, body) ->
      json = JSON.parse body
      title = json['title']
      todayWeather = json['forecasts'][0]
      article = todayWeather['dateLabel'] + 'の' + title + 'は\n    '
      article += todayWeather['telop'] + '\n    '
      article += '最高気温：' + todayWeather['temperature']['max']['celsius'] + '℃\n    '
#      article += '最低気温：' + todayWeather['temperature']['min']['celsius'] + '℃\n'
      article += todayWeather['image']['url']
      robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 43 23 * * *', () =>
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010', (error, res, body) ->
      json = JSON.parse body
      title = json['title']
      tommorowWeather = json['forecasts'][1]
      article = tommorowWeather['dateLabel'] + 'の' + title + 'は\n    '
      article += tommorowWeather['telop'] + '\n    '
      article += '最高気温：' + tommorowWeather['temperature']['max']['celsius'] + '℃\n    '
      article += '最低気温：' + tommorowWeather['temperature']['min']['celsius'] + '℃\n'
      article += tommorowWeather['image']['url']
      robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

