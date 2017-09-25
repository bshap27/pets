class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets, through: :user_pets
  has_many :breeds, through: :user_breeds

  def favorite
  end

  def favorited_pet?(pet)
    UserPet.find_by(user_id: self.id, pet_id: pet.id)
  end

  def favorited_breed?(breed)
    UserBreed.find_by(user_id: self.id, breed_id: breed.id)
  end

  def self.save_selections(selections)
    # current_user.update(:selections => selections)
  end
  
end
