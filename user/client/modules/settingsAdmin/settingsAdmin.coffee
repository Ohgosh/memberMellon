

Template.settingsAdmin.onRendered ->
  Session.set 'appType', 'admin'

  setSelect2 = ->
  @$('#email-settings-choose').select2
    minimumResultsForSearch: Infinity
    width: '100%'

  setSelect2 = ->
  @$('#email-settings-payPall').select2
    minimumResultsForSearch: Infinity
    width: '100%'

  setSelect2 = ->
  @$('#email-settings-stripe').select2
    minimumResultsForSearch: Infinity
    width: '100%'

