@InitCollection = (options) =>
  if _.isString options
    name = options
    options = {}
  else
    name = options.name

  envName = lodash.capitalize name
  endsWith = lodash.last name

  if endsWith is 's'
    collName = name
  else if endsWith is 'y'
    collName = "#{name.substring 0, name.length - 1}ies"
  else
    collName = "#{name}s"

  if Meteor.isCordova
    if Meteor.isClient
      @[envName] = new Meteor.Collection null

      new LocalPersist @[envName], envName
  else
    @[envName] = new Mongo.Collection collName
