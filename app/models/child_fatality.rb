require 'open-uri'

class ChildFatality < ApplicationRecord

	default_scope { where(county: 'Hillsborough').order(dod: :desc) }

	def self.filter(params)
		where parameter_filters(params)
	end

	def self.group_counts(group_by)
		if Rails.env.production?
			# postgresql
			group_by = group_by == :year ? "extract(year from dod)" : group_by
		else
			# sqlite
			group_by = group_by == :year ? "strftime('%Y', dod)" : group_by
		end
		group(group_by).reorder(group_by).count
	end

	def self.scan
		self.scan! if self.needs_scan?
	end

	def self.scan!
		self.destroy_all
		create_arr = []
		xml_doc = Nokogiri::HTML(open("http://www.dcf.state.fl.us/childfatality/data.xml"))
		xml_doc.xpath("//record").each do |record|
			if record.xpath('county').text == 'Hillsborough'
				create_arr << {
					dod: Date.strptime(record.xpath('dod').text,"%m/%d/%Y"),
					gender: record.xpath('gender').text,
					age: record.xpath('age').text.to_i,
					county: record.xpath('county').text,
					priorChild: yesno_to_bool(record.xpath('priorchild').text),
					priorVerChild: yesno_to_bool(record.xpath('priorverchild').text),
					priorTwelve: yesno_to_bool(record.xpath('prior12').text),
					priorFive: yesno_to_bool(record.xpath('prior5').text),
					priorFiveServices: yesno_to_bool(record.xpath('prior5services').text),
					causal: record.xpath('causal').text,
					narrative: record.xpath('narrative').text
				}
			end
		end
		self.create create_arr
	rescue
		return false
	end

	def self.needs_scan?
		self.any? ? (Time.now - self.last_updated) > 5.days : true
	end

	def self.last_updated
		self.any? ? order(updated_at: :desc).first.try(:updated_at) : Time.now
	end

	private

	def self.yesno_to_bool(test)
		test.downcase == 'yes' ? true : false
	end

	def self.parameter_filters(params)
		filters = []
		if Rails.env.production?
			# postgresql
			filters << "extract(year from dod) = '#{params[:year]}'" if params[:year].present?
		else
			# sqlite
			filters << "strftime('%Y', dod) = '#{params[:year]}'" if params[:year].present?
		end
		filters << "age = #{params[:age]}" if params[:age].present?
		filters << "causal LIKE '#{params[:causal]}'" if params[:causal].present?
		filters << "gender LIKE '#{params[:gender]}'" if params[:gender].present?
		filters << "county LIKE '#{params[:county]}'" if params[:county].present?
		filters.join(' AND ').to_s
	end

end
