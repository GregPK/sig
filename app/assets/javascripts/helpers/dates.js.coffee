Ember.Handlebars.helper "timestamp", (ts, options) ->
  return '' unless ts?
  html = "
    <span class=\"label label-primary\">#{ts}</span>
  "
  new Handlebars.SafeString(html)
