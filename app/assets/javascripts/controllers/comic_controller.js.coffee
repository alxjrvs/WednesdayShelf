WS.ComicController = Ember.Controller.extend
  issue: (->
    return @get 'model'
  ).property('model')

  bigHeader: (->
    return @get('model').get 'title'
    ).property('model')

  smallHeader: (->
    return @get('model').get 'series_title'
    ).property('model')

  isIssue: true
  isRelease: false
