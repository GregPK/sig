Ember.Handlebars.helper "timestamp", (ts,data_ts,options) ->
  return '' unless ts?
  
  ts_data_html = data_ts ? '' : " data-ts=#{data_ts}"
  
  html = "
    <span class=\"label label-primary timestamp\"#{ts_data_html}>#{ts}</span>
  "
  new Handlebars.SafeString(html)
