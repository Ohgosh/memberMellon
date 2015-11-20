

Template.createNewMembership.onRendered ->
  Session.set 'appType', 'admin'


  setSelect2 = ->
  @$('#search-category-select2').select2
    minimumResultsForSearch: Infinity
    width: '100%'