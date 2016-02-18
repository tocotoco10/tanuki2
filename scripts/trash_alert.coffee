#
#
#
#


cronJob = require('cron').CronJob



module.exports = (robot) ->
  new cronJob( '0 38 0 * * *', () ->
    data1 =
      content:
        pretext:"(´･Д･)」<ピンポンパンポーーーン♪",
        title:"青葉区桂台のゴミ/資源収集",
        text:"  本日の収集物：可燃ゴミ・不燃ゴミ\n  備考　　　　：スプレー缶もOK",
        color:"#7CD197",
        channel:"test",
        username:"tanukibot"
#    robot.emit "slack.attachment", data1
#    sendSlack(data1)
    robot.emit {room:"test"}, data1, null, true, "Asis/Tokyo"
  ).start()

  new cronJob( '0 28 0 * * *', () =>
    msg = "☆★今日のゴミ収集★☆\n\n"
    msg += " 『プラの日』 \n\n"
    msg += "出し忘れませんように！"
    robot.send {room:"test"}, msg, null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 29 0 * * *', () =>
    msg = "☆★今日のゴミ収集★☆\n\n"
    msg += " 『缶・ビン・ペットボトルの日』 \n\n"
    msg += "今日出し忘れると来週まで出せないポン！"
    robot.send {room:"test"}, msg, null ,true, "Asia/Tokyo"
  ).start()
