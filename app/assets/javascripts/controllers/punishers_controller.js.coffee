SelfImprovementGame.PunishersController = Ember.ArrayController.extend({
  needs: ['application']

  count: (->
    @get 'model.length'
  ).property('@each')

  actions: {
    punish: (pnsh) ->
      ctrl = this
      url = "/status_changes/from_punishment/"+pnsh.get('id')
      $.post(url, (data) ->
        $('.achiever-points-current').fadeOut 'fast', ->
          achiever = ctrl.get('controllers.application.model.achiever')
          achiever.set('points',data.status_change.points_after)
          $(this).fadeIn('fast')
      )
  }
})

