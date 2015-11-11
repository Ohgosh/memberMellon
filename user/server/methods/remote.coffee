allowedCollectionName = Match.Where (val) ->
  _.contains [
    'About'
    'Category'
    'Product'
    'Project'
    'Help'
  ], val

allowedAssetName = Match.Where (val) ->
  _.contains [
    'Images'
    'Videos'
    'JSONs'
  ], val

Meteor.methods
  getGlobalVersion: ->
    return Version.findOne(name: 'Global')?.version

  getVersions: ->
    query =
      name:
        $ne: 'Global'

    return _.reduce Version.find(query).fetch(), (memo, item) ->
      memo[item.name] = item.version
      return memo
    , {}

  getDocsVersions: (collName) ->
    check collName, allowedCollectionName

    res = global[collName].find {},
      fields:
        _id: 1
        __v: 1
    .fetch()

    return res

  getDocs: (collName, ids) ->
    check collName, allowedCollectionName
    check ids, [String]

    return global[collName].find
      _id:
        $in: ids
    .fetch()

  getAssetURL: (collName, id) ->
    check collName, allowedAssetName
    check id, String

    return global[collName].findOne
      _id: id
    .url()
