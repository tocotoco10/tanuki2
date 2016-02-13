module.exports = (robot) ->
  robot.hear /test/i, (res) ->
    res.send "てすとだぽん"

  robot.respond /test2/i, (res) ->
    res.reply "ちょくかえすぽん"

  robot.hear /test3/i, (res) ->
    res.emote "テスt"
