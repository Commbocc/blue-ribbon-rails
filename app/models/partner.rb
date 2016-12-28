class Partner < ApplicationRecord

	default_scope { order(name: :asc) }
	paginates_per 20

	# geocoded_by :address
	# after_validation { geocode_conditionals(:address) }
	#
	# def geocode_conditionals(attribute)
	# 	self.geocode if self.send("#{attribute}_changed?") || self.latitude.nil? || self.longitude.nil?
	# end



end
