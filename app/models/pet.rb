class Pet < ActiveRecord::Base
  has_many :pet_breeds
  has_many :breeds, :through => :pet_breeds
  has_many :user_pets
  has_many :users, through: :user_pets
end

def breeds
  Breed.joins(:pet_breeds).where(pet_id: self.id)
end