#
#
#
#


cronJob = require('cron').CronJob



module.exports = (robot) ->

  sendSlack = (data1) ->
    data =
      content:
        title:"#{data1}"
        color:"#7CD197"
        channel:"test"
        username:"tanukibot"
    robot.emit "slack.attachment", data

  job = new cronJob
    cronTime: "0 26 14 * * *"
    onTick: () ->
      data1 = "テスト"
      sendSlack(data1)
  job.start()

  new cronJob( '0 59 23 * * *', () =>
    data1 =
      content:
        pretext:"(´･Д･)」<ピンポンパンポーーーン♪",
        title:"青葉区桂台のゴミ/資源収集",
        text:"  本日の収集物：可燃ゴミ・不燃ゴミ\n  備考　　　　：スプレー缶もOK",
        color:"#7CD197",
        channel:"test",
        username:"tanukibot"
#    robot.emit "slack.attachment", data
#    sendSlack(data1)
    robot.send {room:"test"}, data1, null, true, "Asis/Tokyo"
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
