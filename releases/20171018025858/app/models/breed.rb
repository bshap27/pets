class Breed < ActiveRecord::Base
  has_many :users
  has_many :pet_breeds
  has_many :pets, :through => :pet_breeds
end
