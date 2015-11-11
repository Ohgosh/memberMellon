@Validator =
  fn: (name, prop) ->
    ->
      if @isSubmitted() is false
        false
      else
        Validator[name] @[prop]()

  exists: (string) -> _.isEmpty string

  email: (email) ->
    not ///
      ^([\w-]+(?:\.[\w-]+)*)
      @((?:[\w-]+\.)*\w[\w-]{0,66})
      \.([a-z]{2,6}(?:\.[a-z]{2})?)$
    ///i.test email

@ErrorMessages =
  exists: (prop) ->
    ->
      return '' unless @isSubmitted()

      unless @[prop]()
        __ 'errors.required'
      else
        ''

  require: (prop) ->
    ->
      return '' unless @isSubmitted()

      unless @[prop]()
        __ 'errors.required'
      else
        ''

  email: (prop) ->
    ->
      return '' unless @isSubmitted()

      if Validator.email @[prop]()
        __ 'errors.invalid-email'
      else
        ''
