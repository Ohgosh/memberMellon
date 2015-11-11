unless Meteor.isCordova
  Meteor.publishComposite 'help', (options) ->
    check options, _pubOptionsMatch

    return {
      find: ->
        Help.find {}, options

      children: [
        find: (item) ->
          unless item?.video
            return

          searchQuery =
            _id:
              $in: []

          if item.video.mp4
            searchQuery._id.$in.push item.video.mp4

          if item.video.webm
            searchQuery._id.$in.push item.video.webm

          if item.video.ogv
            searchQuery._id.$in.push item.video.ogv

          Videos.find searchQuery, _pubVideosFields
      ]
    }
