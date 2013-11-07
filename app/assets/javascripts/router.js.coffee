# For more information see: http://emberjs.com/guides/routing/

SelfImprovementGame.Router.map ()->
  @route 'home', { path: "/" }
  @resource 'status_changes'
  @resource 'achievements'
  @resource 'rewards'
  @resource 'punishers'

