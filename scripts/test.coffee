module.exports = (robot) ->
  robot.hear /test/i, (res) ->
    res.send "てすとだぽん"

  robot.respond /2/i, (res) ->
    res.reply "ちょくかえすぽん"

  robot.hear /3/i, (res) ->
    res.topic "```テスt"
