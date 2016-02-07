#
#
#
#
#

cronJob = require('cron').CronJob
request = require 'request'

module.exports = (robot) ->
  new cronJob( '0 50 23 * * *', () =>
    request 'http://weather.livedoor.com/forecast/webservice/json/v1?city=140010', (error, res, body) ->
      json = JSON.parse body
      title = json['title']
      todayWeather = json['forecasts'][0]
      article = '☆★' + title + '★☆\n'
      article += todayWeather['dateLabel'] + 'は「' + todayWeather['telop'] + '」ですわぁ。\n' + todayWeather['image']['url']
      robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

