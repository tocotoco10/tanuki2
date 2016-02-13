#
#
#
#


cronJob = require('cron').CronJob



module.exports = (robot) ->

  sendSlack = (data) ->
    robot.emit "slack.attachment", data

  new cronJob( '0 36 0 * * *', () =>
    data =
      content:
        pretext:"(´･Д･)」<ピンポンパンポーーーン♪",
        title:"青葉区桂台のゴミ/資源収集",
        text:"  本日の収集物：可燃ゴミ・不燃ゴミ\n  備考　　　　：スプレー缶もOK",
        color:"#7CD197",
        channel:"test",
        username:"tanukibot"
#    robot.emit "slack.attachment", data
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
