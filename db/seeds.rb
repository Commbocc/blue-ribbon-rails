require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CSV.foreach( Rails.root.join('lib', 'assets', 'brc_partners.csv') ) do |row|
	Partner.find_or_create_by(name: row[1], address: row[3]) do |partner|
		partner.description = row[2]
		partner.latitude = row[4]
		partner.longitude = row[5]
	end
end
