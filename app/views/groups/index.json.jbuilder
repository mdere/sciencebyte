json.array!(@groups) do |group|
  json.extract! group, :id, :name, :group_type_id, :total_users, :total_companies
  json.url group_url(group, format: :json)
end
