json.array!(@images) do |image|
  json.extract! image, :url, :location_id
  json.url image_url(image, format: :json)
end
