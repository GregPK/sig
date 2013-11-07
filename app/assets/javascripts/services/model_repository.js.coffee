SelfImprovementGame.ModelRepository = Ember.Object.extend({
  achievements: ->
    @store.find('achievement')
  rewards: ->
    @store.find('reward')
  punishers: ->
    @store.find('punisher')
  statusChanges: ->
    @store.find('status_change')
})
