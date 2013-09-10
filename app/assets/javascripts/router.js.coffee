# For more information see: http://emberjs.com/guides/routing/

WS.Router.map ()->
  @route 'home', path: '/'
  @resource 'weeks', path: "/weeks", ->
    @route 'show', path: "/weels/:week_id"
    @route 'edit', path: "/edit"


WS.HomeRoute = Ember.Route.extend
  model: ->
    return this.get('store').find('release', 'current')

WS.WeeksRoute = Ember.Route.extend
  model: ->
    WS.Release.find()

WS.WeeksShowRoute = Ember.Route.extend

