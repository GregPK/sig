SelfImprovementGame.PunishersRoute = Ember.Route.extend({
  model: ->
    @store.find('punisher')
})
