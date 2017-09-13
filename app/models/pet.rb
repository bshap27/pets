class Pet < ActiveRecord::Base
  has_many :breeds, :through => :pet_breeds
  # def self.find_pet(id_number)
  #   binding.pry
  # end
end