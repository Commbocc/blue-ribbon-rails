module ChildFatalitiesHelper

	def jumper(column, options={})
		return year_jumper if column == :year
		options = ChildFatality.all.map{ |record|
			jump_url = url_for(params.except(:action, :controller).merge(column => record.send(column)).permit!)
			[
				record.send(column),
				record.send(column),
				data: {jumper: jump_url}
			]
		}.uniq.sort
		options.unshift [column.capitalize, nil, data: {jumper: url_for(params.except(:action, :controller, column.to_sym).permit!)}]
		select_tag column, options_for_select( options, params[column] ), class: 'jumper-select form-control input-sm'
	end

	def year_jumper
		options = ChildFatality.all.map{ |record|
			jump_url = url_for(params.except(:action, :controller).merge(year: record.dod.year).permit!)
			[
				record.dod.year,
				record.dod.year,
				data: {jumper: jump_url}
			]
		}.uniq.sort.reverse
		options.unshift ['Year', 'test', data: {jumper: url_for(params.except(:action, :controller, :year).permit!)}]
		select_tag 'year', options_for_select( options, params[:year] ), class: 'jumper-select form-control input-sm'
	end

end
