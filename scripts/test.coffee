module.exports = (robot) ->
  robot.hear /test/i, (res) ->
    res.send "てすとだぽん"

  robot.respond /2/i, (res) ->
    res.reply "ちょくかえすぽん"

  robot.hear /3/i, (res) ->
    data =
      content:
        pretext:"(´･Д･)」< 秘書タヌキからのお知らせっ！"
        title:"今日のゴミ収集予定"
        text: "てすとてすと\nどうなるの？"
        fields:[
          {
            title:"分類",
            value:"缶・ビン・ペットボトル",
            short:true
          },
          {
            title:"メモ",
            value:"スプレー缶は可燃の日でOK！",
            short:true
          }
        ]
        color: "#7CD197"
      channel: "test"
      username: "tanukibot"
    robot.emit "slack.attachment", data
