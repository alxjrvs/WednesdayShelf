WS.HomeController = Ember.Controller.extend
  week: (->
    return @get 'model'
  ).property('model')

