@BaseViewModel = ->
  reactiveSubmitted = new ReactiveVar false

  isSubmitted: -> do reactiveSubmitted.get
  wasSubmitted: (reverse) ->
    value = if _.isBoolean reverse then reverse else true
    reactiveSubmitted.set value

  check: (cb) ->
    do @wasSubmitted

    unless _.isFunction @checkForm
      return @proceedCheck cb

    @checkForm =>
      @proceedCheck cb

  proceedCheck: (cb) ->
    cb do @toJS if _.isFunction cb
