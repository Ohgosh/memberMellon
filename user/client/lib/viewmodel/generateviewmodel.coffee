@GenerateViewModel = (params) ->
  result = {}

  rules = []

  _.each params.fields, (type, name) ->
    result[name] = ''

    if _.isString(type) and type.length
      invalidRuleName = "#{name}Invalid"
      rules.push invalidRuleName

      result[invalidRuleName] = Validator.fn type, name
      result["#{name}Message"] = ErrorMessages[type] name

  if rules.length
    result.checkForm = (next) ->
      isValid = true

      _.each rules, (rule) =>
        isValid = !@[rule]()

      do next if isValid

  if params.extendWith
    _.extend result, params.extendWith

  result
