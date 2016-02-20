#
#
#
#


cronJob = require('cron').CronJob



module.exports = (robot) ->

#  sendSlack = (ab) ->
#    data =
#      content:
#        pretext:"aaa"
#        title:"bbb"
#        text:"ccc"
#        color:"#7CD197"
#				channel:"test"
#        username:"tanukibot"
#    robot.emit "slack.attachment", data

  cronJob = new cronJob(
    cronTime: "0 40 0 * * *"
    start: true
    timeZone: "Asia/Tokyo"
    onTick: ->
#      data =
#        content:
#          pretext:"aa"
#          title:"bb"
#          text:"cc"
#          color:"#7CD197"
#          channel:"test"
#          username:"tanukibot"
#      robot.emit "slack.attachment", data
      data = "abc"
      robot.send {room:test}, data
  )
#  job = new cronJob
#    cronTime: "0 20 11 * * *"
#    onTick: () ->
#      sendSlack ab
#  job.start()

#  new cronJob( '0 38 0 * * *', () ->
#    data1 =
#      content:
#        pretext:"(´･Д･)」<ピンポンパンポーーーン♪",
#        title:"青葉区桂台のゴミ/資源収集",
#        text:"  本日の収集物：可燃ゴミ・不燃ゴミ\n  備考　　　　：スプレー缶もOK",
#        color:"#7CD197",
#        channel:"test",
#        username:"tanukibot"
#    robot.emit "slack.attachment", data1
#    sendSlack (data1) ->
#    robot.emit {room:"test"}, data1, null, true, "Asis/Tokyo"
#  ).start()
