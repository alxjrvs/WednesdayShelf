# For more information see: http://emberjs.com/guides/routing/

WS.Router.map ()->
  @resource 'week', path: '/week/:week_id'
  @resource 'weeks', path: "/weeks"
  @resource 'comic', path: '/comic/:comic_id'


WS.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('week',
      @get('store').find('release', 'current'))

WS.WeekRoute = Ember.Route.extend
  model: (params) ->
    WS.Release.find(params.week_id)
  renderTemplate: (controller, model) ->
    @_super controller, model
    @render 'bar', {outlet: 'sidebar'}

WS.WeeksRoute = Ember.Route.extend
  model: ->
    WS.Release.find()

WS.ComicRoute = Ember.Route.extend
  model: (params) ->
    WS.Issue.find(params.comic_id)
  renderTemplate: (controller, model) ->
    @_super controller, model
    @render 'bar', {outlet: 'sidebar'}

