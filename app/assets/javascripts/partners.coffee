# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	L.mapbox.accessToken = 'pk.eyJ1Ijoia2ptYWdpYzEzIiwiYSI6ImNpZzlpMGo1OTBsd2R1OWtrZjVwcHF0YmgifQ.gk94RmwBZrH90QoP2HHQXA'

	map = L.mapbox.map('map', 'mapbox.streets') if $('#map').length

	$partners = $('.brc-partner')
	latlngs = []

	$partners.each (i) ->
		partner = $(this)

		# show-link click
		show_link = partner.find('a')
		show_link.click (e) ->
			e.preventDefault()
			openModal(partner)
			return

		# marker
		if _.isNumber $(this).data('longitude')
			coord = [partner.data('latitude'), partner.data('longitude')]
			latlngs.push coord

			marker = L.marker(coord)
			marker.on 'click', ->
				openModal(partner)
				return

			marker.addTo map if $('#map').length
		return

	map.fitBounds latlngs if $('#map').length

	# open modal function
	openModal = (partner) ->
		$('#partnerModal .modal-content').load partner.data('path'), ->
			$('#partnerModal').modal('show')
			return
		return
