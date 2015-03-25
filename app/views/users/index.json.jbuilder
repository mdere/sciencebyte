json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :hashed_password, :user_type_id, :science_points
  json.url user_url(user, format: :json)
end
