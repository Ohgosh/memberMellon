unless Meteor.isCordova
  Meteor.publishComposite 'product', (query, options, withCategory) ->
    check query, _pubQueryMatch
    check options, _pubOptionsMatch

    return {
      find: ->
        Product.find query, options

      children: [
        find: (item) ->
          if item?.image
            Images.find item.image, _pubImagesFields
      ,
        find: (item) ->
          if item?.images2d
            Images.find
              _id:
                $in: item.images2d
            , _pubImagesFields
      ,
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
      ,
        find: (item) ->
          unless modelLength = item?.model?.length
            return

          searchQuery =
            _id:
              $in: []

          while modelLength--
            model = item.model[modelLength]

            if model.json
              searchQuery._id.$in.push model.json

          JSONs.find searchQuery, _pubJsonsFields
      ,
        find: (item) ->
          if withCategory and item?.category
            Category.find item.category,
              fields:
                name: 1
                'attributes.label': 1
                'attributes.name': 1
                'attributes.position': 1
      ]
    }
