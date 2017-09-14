class Pet < ActiveRecord::Base
  has_many :breeds, :through => :pet_breeds

  # def self.find_pet_in_db(petfinder_num)
  #   self.find_by(petfinder_num: petfinder_num)
  # end

end