#
#
#
#


cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob( '0 30 7 * * 2,6', () =>
    msg = "☆★今日のゴミ収集★☆\n\n"
    msg += " 『可燃・不燃の日』 \n\n"
    msg += "出し忘れませんように！"
    robot.send {room:"general"}, msg, null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 30 7 * * 1', () =>
    msg = "☆★今日のゴミ収集★☆\n\n"
    msg += " 『プラの日』 \n\n"
    msg += "出し忘れませんように！"
    robot.send {room:"general"}, msg, null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 30 7 * * 3', () =>
    msg = "☆★今日のゴミ収集★☆\n\n"
    msg += " 『缶・ビン・ペットボトルの日』 \n\n"
    msg += "今日出し忘れると来週まで出せないポン！"
    robot.send {room:"general"}, msg, null ,true, "Asia/Tokyo"
  ).start()