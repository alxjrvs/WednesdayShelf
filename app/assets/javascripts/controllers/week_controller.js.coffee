WS.WeekController = Ember.Controller.extend
  week: (->
    return @get 'model'
  ).property('model')


  bigHeader: (->
    return @get('model').get 'long_release_date'
    ).property('model.release_date')

  smallHeader: (->
    return @get('model').get('short_release_date')
    ).property('model.release_date')

  isIssue: false
  isRelease: true

  hasPrev: (->
    if @get('week').get('previous') == null
      return false
    else
      return true
    ).property('model.release_date')

  hasNext: (->
    if @get('week').get('next') == null
      return false
    else
      return true
  ).property('model.release_date')

