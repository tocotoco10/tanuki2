#
#
#
#


cronJob = require('cron').CronJob

module.exports = (robot) ->

##  sendSlack = (words,res) ->
##    data =
##      content:
##        pretext:"#{words}"
##        title:"本日のゴミ/資源収集＜青葉区桂台＞"
##        text:"ccc"
##        color:"#7CD197"
##      channel:"test"
##      username:"tanukibot"
##    robot.emit "slack.attachment", data
#    return
#    robot.send {room:"test"}, words

##  cronJob = new cronJob(
##    cronTime: "0 40 0 * * *"
#    start: true
#    timeZone: "Asia/Tokyo"
##    onTick: ->
##      wd = "(´･Д･)」< ピンポンパンポーーーン♪"
#        content:
#          pretext:"aa"
#          title:"bb"
#          text:"cc"
#          color: "#7CD197"
#          channel: "test"
#          username: "tanukibot"
##      sendSlack (wd)
##      return
#        robot.emit "slack.attachment", #{data}
#      robot.emit "slack.attachment", data
#      data = "abc"
#      robot.send {room:"test"}, data
##    start: true
##    timeZone: "Asia/Tokyo"
##  )

  sendSlack = (data1,res) ->
    robot.emit "slack.attachment", data1

  cronJob = new cronJob(
    cronTime: "0 55 23 * * *"
    onTick: ->
      data =
        content:
          pretext:"(´･Д･)」< ピンポンパンポーーーン♪\n"
          title:"＜青葉区桂台|水曜＞ゴミ/資源回収の対象"
          text:"　缶・ビン・ペットボトル :champagne:"
          color:"#7CD197"
        channel:"test"
        username:"tanukibot"
      sendSlack (data)
      return
    start: true
    timeZone: "Asia/Tokyo"
  )

#  new cronJob( '0 34 0 * * *', () =>
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
