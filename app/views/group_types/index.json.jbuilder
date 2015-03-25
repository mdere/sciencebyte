json.array!(@group_types) do |group_type|
  json.extract! group_type, :id, :desc
  json.url group_type_url(group_type, format: :json)
end
