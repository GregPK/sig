Ember.Handlebars.helper "point-change", (points, options) ->
  points = parseInt(points)

  klass = ''
  if points > 0
    klass = 'point-gain'
    points = "+#{points}"
  else if points < 0
    klass = 'point-cost'
    points = "#{points}".replace('-','-&thinsp;')

  new Handlebars.SafeString("<span class=\"label points-change #{klass}\">" + points + "</span>")

Ember.Handlebars.helper "point-type", (points, type) ->
  points = parseInt(points)
  points = "+#{points}" if points > 0
  points = "#{points}".replace('-','-&thinsp;')

  new Handlebars.SafeString("<span class=\"label points-type points-type-#{type}\">" + points + "</span>")

Ember.Handlebars.helper "add-sign", (points) ->
  points = parseInt(points)
  points = "+#{points}" if points > 0
  points = "#{points}".replace('-','&ndash;&thinsp;')
  new Handlebars.SafeString(points)

