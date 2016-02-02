# Description
#   A Hubot script that response words for tanuki
#
# Dependencies:
#   None
#
# Commands:
#
#

rtxt1 = [
  "ポン？",
  "ポコポコポーン♪",
  "タヌタヌタヌッキー！",
  "ぶんぶくちゃがま！",
  "ちゃうよ！キツネだポン！",
  "赤いキツネ食べたい。",
  "緑のどん兵衛？",
  "月が〜でーたで〜た〜♪",
	"かちかち山は近づきません...",
  "うどん出汁は関西風でおなしゃす。"
]

module.exports = (robot) ->
  robot.hear /(たぬき|タヌキ|そば|うどん)/, (msg) ->
    msg.send msg.random rtxt1
