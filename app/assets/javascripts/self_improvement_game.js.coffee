window.SelfImprovementGame = Ember.Application.create(
  rootElement: '#ember-app'
  LOG_STACKTRACE_ON_DEPRECATION : true
  LOG_BINDINGS                  : true
  LOG_TRANSITIONS               : true
  LOG_TRANSITIONS_INTERNAL      : true
  LOG_VIEW_LOOKUPS              : true
  LOG_ACTIVE_GENERATION         : true
)

#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

