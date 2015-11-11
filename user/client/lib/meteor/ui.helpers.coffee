Template.registerHelper '_', __

Template.registerHelper 'assetUrl', (assetName, id, store) ->
  unless typeof id is 'string' then return ''
  if id? and id.indexOf('/img/') > -1 then return id

  unless assetName and id then return ''

  hasStore = _.isString store

  params = if hasStore
    store: store

  window[assetName].findOne({_id: id})?.url params
