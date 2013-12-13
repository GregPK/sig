Ember.Handlebars.helper "timestamp", (ts, options) ->
  return '' unless ts?
  html = "
    <span class=\"label label-primary timestamp\">#{ts}</span>
  "
  new Handlebars.SafeString(html)
