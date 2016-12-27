$ ->

	# nav spacer animation
	$(document).on {
		mouseenter: ->
			$elem = $(this).find('.hc-nav-dropdown')
			$('#navSpacer').stop().animate { height: $elem.outerHeight(true) }, 500 unless $('#hc-main-nav-collapse').hasClass('in')
			return
		mouseleave: ->
			$('#navSpacer').finish().animate { height: 0 }, 500
			return
	}, '#hc-main-nav-sections > li'


	# navigationAPI = "http://hcflgov.net/api/navigation"
	navigationAPI = '/navigation/navigation.json'
	templateDir =  '/navigation/templates'

	$.getJSON(navigationAPI).success (data) ->

		# logo
		$logo = $('#hc-main-nav-logo')
		$logo.attr('src', [data.root_url, data.header.logo_src].join('/'))

		# header nav items
		$header_nav_items = $('#hc-main-nav-sections')
		$.get templateDir+'/nav_item.html', (templateData) ->
			template = _.template(templateData)
			_.each data.header.navigation.reverse(), (item) ->
				$header_nav_items.prepend(template(item: item, root_url: data.root_url))
				return
			return
		, 'html'

		# i want to
		$i_want_to = $('#nav-i-want-to > .dropdown-menu > .row')
		$.get templateDir+'/nav_iwt_item.html', (templateData) ->
			template = _.template(templateData)
			_.each data.header.i_want_tos.reverse(), (item) ->
				$i_want_to.prepend(template(item: item, root_url: data.root_url))
				return
			return
		, 'html'

		return
