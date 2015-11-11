unless Meteor.isCordova
  Meteor.publishComposite 'category', (query, options) ->
    check query, _pubQueryMatch
    check options, _pubOptionsMatch

    return {
      find: ->
        Category.find query, options

      children: [
        find: (item) ->
          if item?.image
            Images.find item.image, _pubImagesFields
      ]
    }
