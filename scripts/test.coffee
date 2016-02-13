module.exports = (robot) ->
  robot.hear /test/i, (res) ->
    res.send "てすとだぽん"

  robot.respond /2/i, (res) ->
    res.reply "ちょくかえすぽん"

  robot.hear /3/i, (res) ->
    data =
      content:
        text: "てすとてすと\nどうなるの？"
        color: "#7e8dab"
      channel: "test"
      username: "tanukibot"
    robot.emit "slack.attachment", data
