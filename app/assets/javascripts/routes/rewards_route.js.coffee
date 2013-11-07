SelfImprovementGame.RewardsRoute = Ember.Route.extend({
  model: ->
    @store.find('reward')
})
