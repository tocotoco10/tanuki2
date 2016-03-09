#
#
#
#


cronJob = require('cron').CronJob

module.exports = (robot) ->

  sendSlack = (data1,res) ->
    robot.emit "slack.attachment", data1

  cronJob = new cronJob(
    cronTime: "0 15 8 * * 1"
    onTick: ->
      data =
        content:
          pretext:"(´･Д･)」< ピンポンパンポーーーン♪\n"
          title:"＜青葉区桂台|月曜＞ゴミ/資源の収集"
          text:"　待ってました！かさばるプラゴミ収集の日だポン♪"
          fields:[
            {
              title:"収集物",
              value:"　　プラ容器・プラ包装 :candy:",
              short:false
            },
            {
              title:"メモ",
              value:"　　",
              short:false
            }
          ]
          color:"#7CD197"
        channel:"general"
        username:"tanukibot"
      sendSlack (data)
      return
    start: true
    timeZone: "Asia/Tokyo"
  )


