# Description:
#   Announce train information
#
# Commands:
#   None
#
# Author
#



module.exports = (robot) ->
  robot.hear /電車/i, (res) ->
    NO_RESULT_MESSAGE = "事故・遅延情報は教えて貰えませんでしたね"
    TROUBLE_MESSAGE_PREFIX = "事故・遅延状況を確認して来たんじゃ"
    TRAIN_INFORMATION_URL = "http://transit.yahoo.co.jp/traininfo/area/3/"

    cheerio = require "cheerio-httpcli"

    # table をパースして整形したメッセージを返す
    parseTable = ($table) ->
      $tr = $table.find("tr")
      if $tr.length != 0
        message = TROUBLE_MESSAGE_PREFIX + "\n```"

        $tr.each (i) ->
          # 最初の tr は表題が入るのでスルー
          if i >= 1
            $this = $tr.eq(i)

            line   = $this.find("td").eq(0).find("a").text()
            status = $this.find("td").eq(1).find(".colTrouble").text()
            info   = $this.find("td").eq(2).text()

            message += "#{line}／#{status}：#{info}\n```"
      else
        message = NO_RESULT_MESSAGE

      return message

    # Yahoo! から運行情報を取得
    response = cheerio.fetch TRAIN_INFORMATION_URL

    response.then (result) ->
      $trouble = result.$(".elmTblLstLine.trouble")
      $table   = $trouble.find("table")
      message  = if $trouble.text() then $trouble.text() else NO_RESULT_MESSAGE

      if $table.length != 0
        res.emote parseTable($table)
      else
        res.emote message.replace(/[\n\r]/g, "")
