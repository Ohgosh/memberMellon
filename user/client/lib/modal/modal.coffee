@Modal = (data) ->
  @data = data
  do @render unless @data.autocreate is false

@Modal::render = (data = {}) ->
  return if @renderedView and not @renderedView.isDestroyed

  _.extend @data, data

  check @data,
    title: Match.OneOf String, Boolean
    message: Match.OneOf String, Boolean
    yesCallback: Match.Optional Function
    noCallback: Match.Optional Function
    autocreate: Match.Optional Boolean

  tplData = _.clone @data
  tplData.remove = _.bind @remove, @

  @renderedView = Blaze.renderWithData Template.modalWindow, tplData,
    document.getElementsByTagName('body')[0]

@Modal::remove = ->
  Blaze.remove @renderedView

Template.modalWindow.events
  'click .t-close': ->
    do @remove
    @noCallback?()
  'click .t-cancel': ->
    do @remove
    @noCallback?()
  'click .t-ok': ->
    do @remove
    @yesCallback?()
