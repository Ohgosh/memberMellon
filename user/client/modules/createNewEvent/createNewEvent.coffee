Template.createNewEvent.onRendered ->
  Session.set 'appType', 'admin'

  setSelect2 = ->
  @$('#details-from-prev-event').select2
    minimumResultsForSearch: Infinity
    width: '100%'

  setSelect2 = ->
  @$('#choose-the-date').select2
    minimumResultsForSearch: Infinity
    width: '100%'

  setSelect2 = ->
  @$('#tickets-type').select2
    minimumResultsForSearch: Infinity
    width: '100%'

  setSelect2 = ->
  @$('#approving-way').select2
    minimumResultsForSearch: Infinity
    width: '100%'

  setSelect2 = ->
  @$('#pricing-info').select2
    minimumResultsForSearch: Infinity
    width: '100%'