json.array!(@user_pets) do |user_pet|
  json.extract! user_pet, :id
  json.url user_pet_url(user_pet, format: :json)
end
