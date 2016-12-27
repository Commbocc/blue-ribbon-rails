module ChildFatalitiesHelper

	def jumper(column, options={})

		return year_jumper if column == :year

		options = ChildFatality.all.map{ |record|
			jump_url = url_for(params.except(:action, :controller, column.to_sym).merge(column => record.send(column)).permit!)
			[
				record.send(column),
				record.send(column),
				data: {jumper: jump_url}
			]
		}.uniq.sort

		options.unshift [column.capitalize, nil, data: {jumper: url_for(params: params.except(:action, :controller, column).to_h)}]

		select_tag column, options_for_select( options, params[column] ), class: 'jumper-select form-control'
	end

	def year_jumper

		options = ChildFatality.all.map{ |record|
			jump_url = url_for(params.except(:action, :controller, :year).merge(year: record.dod.year).permit!)
			[
				record.dod.year,
				record.dod.year,
				data: {jumper: jump_url}
			]
		}.uniq.sort.reverse

		options.unshift ['Year', nil, data: {jumper: url_for(params: params.except(:action, :controller, :year).to_h)}]

		select_tag 'year', options_for_select( options, params[:year] ), class: 'jumper-select form-control'
	end


end
