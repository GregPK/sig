SelfImprovementGame.StatusChange = DS.Model.extend(
  source: DS.attr()
  point_change: DS.attr()
  points_after: DS.attr()
  ts: DS.attr('date')

  isPositive: (->
    parseInt(@get('point_change')) > 0
  ).property('point_change')

  relative_ts: (->
    ts = @get('ts')
    return null unless ts? and typeof(ts) is 'object'
    "#{ts.getFullYear()}/#{ts.getMonth()}/#{ts.getDay()}"
  ).property('ts')
)