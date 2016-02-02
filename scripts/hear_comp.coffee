# Description
#   A Hubot script that response for comp
#
# Dependencies:
#   None
#
# Commands:
#

rtxt = [
  "おつかれちゃーん♪",
  "ポン菓子食べる？",
  "( ´・ω・)つ旦",
  "ホンマに終わったぬ？？？",
  "(｀･ω･´)ゞお勤めご苦労様たぬ！"
]

module.exports = (robot) ->
  robot.hear /(.*)(完了し|終わり|終了し)(.*)/, (msg) ->
    msg.send msg.random rtxt
