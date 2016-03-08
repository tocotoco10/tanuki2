#
#
#
#


cronJob = require('cron').CronJob

module.exports = (robot) ->

  sendSlack = (data1,res) ->
    robot.emit "slack.attachment", data1

  cronJob = new cronJob(
    cronTime: "0 15 8 * * 3"
    onTick: ->
      data =
        content:
          pretext:"(´･Д･)」< ピンポンパンポーーーン♪\n"
          title:"＜青葉区桂台|水曜＞ゴミ/資源の収集"
          text:"　出し忘れちゃヤーーーヨ！"
          fields:[
            {
              title:"収集物",
              value:"　　缶・ビン・ペットボトル :champagne:",
              short:false
            },
            {
              title:"メモ",
              value:"　　スプレー缶は可燃の日に出すこと",
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


  cronJob2 = new cronJob(
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

  cronJob3 = new cronJob(
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

