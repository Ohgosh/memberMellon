@__ = (key) ->
  lodash.get _localization, key, key

@_processAdjacents = (docs, _id) ->
  result = []

  docsLength = docs.length
  while docsLength--
    doc = docs[docsLength]

    if doc._id + '' == _id # found our item
      index = docsLength

  lastIndex = docs.length - 1

  if index == 0
    if docs[lastIndex]
      result.push docs[lastIndex]

    if docs[index + 1]
      result.push docs[index + 1]

  else if index == lastIndex
    if docs[index - 1]
      result.push docs[index - 1]

    if docs[0]
      result.push docs[0]

  else
    if docs[index - 1]
      result.push docs[index - 1]

    if docs[index + 1]
      result.push docs[index + 1]

  if result.length is 1
    result.push docs[0]

  result

@_addEventListeners = (el, str, fn) ->
  events = str.split ' '
  eventsLength = events.length
  while eventsLength--
    event = events[eventsLength]
    el.addEventListener event, fn, false

@_removeEventListeners = (el, str, fn) ->
  events = str.split ' '
  eventsLength = events.length
  while eventsLength--
    event = events[eventsLength]
    el.removeEventListener event, fn, false
