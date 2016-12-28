json.extract! partner, :id, :name, :description, :address, :latitude, :longitude, :phone, :created_at, :updated_at
json.url partner_url(partner, format: :json)