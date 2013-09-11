WS.Issue = DS.Model.extend
  release: DS.belongsTo 'WS.Release'
  series_title: DS.attr 'string'
