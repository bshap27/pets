json.array!(@user_breeds) do |user_breed|
  json.extract! user_breed, :id
  json.url user_breed_url(user_breed, format: :json)
end
