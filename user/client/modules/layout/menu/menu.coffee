Template.menu.helpers
  getOtherTypePath: ->
    type = Session.get 'appType'

    if type is 'admin'
      return 'main'

    return 'admin'

  getOtherTypeLabel: ->
    __ "menu.switch.#{Session.get('appType')}"
