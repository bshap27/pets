class Pet < ActiveRecord::Base
  has_many :breeds, :through => :pet_breeds
  has_many :users, through: :user_pets
end