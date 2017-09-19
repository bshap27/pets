class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :breeds
  has_many :pets, through: :user_pets

  def initialize(email)
    @email = email
    breeds = []
  end

  def favorite
  end
end
