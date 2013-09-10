WS.Release = DS.Model.extend({
  release_date: DS.attr('date')
  issues: DS.hasMany('WS.Issue')

  releaseDate: ->
    return this.get('release_date')
  });
