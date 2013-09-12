WS.Release = DS.Model.extend
  release_date: DS.attr 'date'
  long_release_date: DS.attr 'string'
  short_release_date: DS.attr 'string'
  next: DS.attr 'number'
  previous: DS.attr 'number'
  issues: DS.hasMany 'WS.Issue', {embedded: true}

