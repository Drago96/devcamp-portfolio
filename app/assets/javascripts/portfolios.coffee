make_portfolios_sortable = ->
	set_positions()

	$('.sortable').sortable().bind 'sortupdate', ->
		set_positions()

		updated_order = []

		$('.sortable-card').each (i) ->
			updated_order.push {
				id: $(this).data('id'),
				position: i + 1
			}

		$.ajax {
			type: 'PUT',
			url: '/portfolios/sort',
			data: {
				order: updated_order
			}
		}

set_positions = ->
	$('.sortable-card').each (i) ->
		$(this).attr 'data-pos', i + 1

$ ->
	make_portfolios_sortable()
