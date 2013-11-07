SelfImprovementGame.HomeRoute = Ember.Route.extend({
  model: ->
    components = ['achievement','reward','punisher']
    r = {}
    r[cmp+"s"] = @store.find(cmp) for cmp in components
    r
})