define ['components/flight/lib/component'], (defineComponent) ->
  totalComponent = ->

    @sumUpSessionsNum = ->
      result = 0
      $(".tasktime").each ->
        val = $(@).text().trim()
        split = val.split ":"
        result += 60 * ((Number) split[0]) + ((Number) split[1])
      result

    @sumUpSessions = ->
      n = @sumUpSessionsNum()
      hours = parseInt(n / 60)
      mins = n % 60
      sHours = if hours < 10 then "0" + hours else hours.toString()
      sMins = if mins < 10 then "0" + mins else mins.toString()
      "#{sHours}:#{sMins}"

    @addTotal = ->
      template = '<div class="row"><div class="span6 total"><div class="row">' +
        '<div class="span5">Total</div><div class="span1">' + @sumUpSessions() +
        '</div></div></div></div>'
      $(".task").last().parent().parent().append(template)

    @calc = ->
      alert "da"
      @addTotal()

    @after "initialize", ->
      @calc()

  defineComponent totalComponent