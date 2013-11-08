json.array!(@groups) do |group|
  json.extract! group, :user_id, :name, :description
  json.url group_url(group, format: :json)
end
