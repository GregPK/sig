SelfImprovementGame.ApplicationRoute = Ember.Route.extend({
  model: ->
    achiever: @store.find('achiever',1)
})