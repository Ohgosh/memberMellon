@_escapeRegExp = (str) ->
  if not str
    return

  str.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&'
