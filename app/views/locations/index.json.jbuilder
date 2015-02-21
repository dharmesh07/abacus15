json.array!(@locations) do |location|
  json.extract! location, :id, :user_id, :latlong, :pos_name, :email
  json.url location_url(location, format: :json)
end
