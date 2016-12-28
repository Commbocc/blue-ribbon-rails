class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :set_page_title

	def set_page_title
		@page_title ||= ''
	end

end
