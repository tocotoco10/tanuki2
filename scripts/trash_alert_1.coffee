#
#
#
#


cronJob = require('cron').CronJob

module.exports = (robot) ->

  sendSlack = (data1,res) ->
    robot.emit "slack.attachment", data1

  cronJob = new cronJob(
    cronTime: "0 15 8 * * 2,6"
    onTick: ->
      data =
        content:
          pretext:"(´･Д･)」< ピンポンパンポーーーン♪\n"
          title:"＜青葉区桂台|火・土＞ゴミ/資源の収集"
          text:"　生ゴミは出し忘れないようにの日だポン♪"
          fields:[
            {
              title:"収集物",
              value:"　　燃やすゴミ・スプレー缶・燃えないゴミ・乾電池 :fire:",
              short:false
            },
            {
              title:"メモ",
              value:"　　各々別の袋にまとめルンだポン！",
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


