class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets, through: :user_pets

  def favorite
  end

  def favorited_pet?(pet)
    UserPet.find_by(user_id: self.id, pet_id: pet.id)
  end
  
end
