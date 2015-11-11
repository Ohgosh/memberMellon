unless Meteor.isCordova
  Meteor.publish 'about', (options) ->
    check options, _pubOptionsMatch

    About.find {}, options
