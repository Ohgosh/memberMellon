unless Meteor.isCordova
  Meteor.publishComposite 'productSearch', (options) ->
    query =
      $and: []

    if _.isString(options.searchQuery) and options.searchQuery.length
      searchRegExp = new RegExp _escapeRegExp(options.searchQuery), 'i'

      query.$and.push
        $or: [
            name: searchRegExp
          ,
            title: searchRegExp
          ]

    if options.searchCategory
      query.$and.push
        category: options.searchCategory

    unless query.$and.length
      return

    return {
      find: ->
        Product.find query,
          fields:
            _position: 1
            category: 1
            image: 1
            name: 1

      children: [
        find: (item) ->
          if item?.image
            Images.find item.image, _pubImagesFields
      ]
    }

  Meteor.publishComposite 'projectSearch', (options) ->
    query =
      $and: []

    if _.isString(options.searchQuery) and options.searchQuery.length
      searchRegExp = new RegExp _escapeRegExp(options.searchQuery), 'i'

      query.$and.push
        $or: [
          name: searchRegExp
        ,
          title: searchRegExp
        ]

    if options.searchFrom
      query.$and.push
        endDate:
          $gte: moment(options.searchFrom, 'DD.MM.YYYY').startOf('day').toDate()

    if options.searchTo
      query.$and.push
        startDate:
          $lte: moment(options.searchTo, 'DD.MM.YYYY').endOf('day').toDate()

    unless query.$and.length
      return

    return {
      find: ->
        Project.find query,
          fields:
            _position: 1
            endDate: 1
            image: 1
            name: 1
            startDate: 1

      children: [
        find: (item) ->
          if item?.image
            Images.find item.image, _pubImagesFields
      ]
    }
