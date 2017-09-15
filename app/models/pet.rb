class Pet < ActiveRecord::Base
  has_many :breeds, :through => :pet_breeds
end