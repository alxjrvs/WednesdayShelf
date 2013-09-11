# For more information see: http://emberjs.com/guides/routing/

WS.Router.map ()->
  @route 'home', path: '/'
  @resource 'week', path: '/week/:week_id'
  @resource 'weeks', path: "/weeks"
  @resource 'comic', path: '/comic/:comic_id'


WS.HomeRoute = Ember.Route.extend
  model: ->
    return this.get('store').find('release', 'current')

WS.WeekRoute = Ember.Route.extend
  model: (params) ->
    WS.Release.find(params.week_id)

WS.WeeksRoute = Ember.Route.extend
  model: ->
    WS.Release.find()

WS.ComicRoute = Ember.Route.extend
  model: (params) ->
    WS.Issue.find(params.comic_id)

