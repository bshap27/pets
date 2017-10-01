class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_pets
  has_many :pets, through: :user_pets
  has_many :breeds, through: :user_breeds
  has_many :user_searches

  def favorite
  end

  def favorited_pet?(pet)
    UserPet.find_by(user_id: self.id, pet_id: pet.id)
  end

  def favorited_breed?(breed)
    UserBreed.find_by(user_id: self.id, breed_id: breed.id)
  end
  
end
