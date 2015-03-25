json.array!(@company_groups) do |company_group|
  json.extract! company_group, :id, :company_id, :group_id
  json.url company_group_url(company_group, format: :json)
end
