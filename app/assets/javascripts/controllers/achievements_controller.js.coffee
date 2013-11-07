SelfImprovementGame.AchievementsController = Ember.ArrayController.extend({
  needs: ['application']

  count: (->
    @get 'model.length'
  ).property('@each')

  actions: {
    achieve: (amnt) ->
      ctrl = this
      url = "/status_changes/from_achievement/"+amnt.get('id')
      $.post(url, (data) ->
        $('.achiever-points-current').fadeOut 'fast', ->
          achiever = ctrl.get('controllers.application.model.achiever')
          achiever.set('points',data.status_change.points_after)
          $(this).fadeIn('fast')
      )

  }
})