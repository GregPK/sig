SelfImprovementGame.StatusChangesRoute = Ember.Route.extend({
  model: ->
    @store.find('status_change')
})
