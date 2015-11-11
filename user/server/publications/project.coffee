unless Meteor.isCordova
  Meteor.publishComposite 'project', (query, options) ->
    check query, _pubQueryMatch
    check options, _pubOptionsMatch

    return {
      find: ->
        Project.find query, options

      children: [
        find: (item) ->
          if item?.image
            Images.find item.image, _pubImagesFields
      ]
    }
