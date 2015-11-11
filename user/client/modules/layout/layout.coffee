Template.registerHelper 'imgUrl', (id) ->
  url = do Images.findOne({_id: id})?.url if id
  return url or ''

Template.registerHelper 'key_value', (context, options) ->
  result = _.map context, (value, key) ->
    key: key
    value: value
