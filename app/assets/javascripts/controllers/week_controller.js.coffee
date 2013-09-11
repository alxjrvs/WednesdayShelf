WS.WeekController = Ember.ObjectController.extend
  nextRelease: ->
    id = @get 'model.next'
    return WS.Release.find(id)

  previousRelease: ->
    id = @get 'model.previous'
    return WS.Release.find(id)
