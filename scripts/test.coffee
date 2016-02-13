module.exports = (robot) ->
  robot.hear /test/i, (res) ->
    res.send "てすとだぽん"

  robot.respond /2/i, (res) ->
    res.reply "ちょくかえすぽん"

  robot.hear /3/i, (res) ->
    data =
      content:
        text: "てすとてすと"
        color: "#e84050"
      channel: "general"
      username: "tanukibot"
      icon_emoji: ":shit:"
    robot.emit "slack.attachment", data
