class User < ActiveRecord::Base
  has_many :breeds
  has_many :pets, through: :user_pets

  def initialize(email)
    @email = email
    breeds = []
  end

  def favorite
  end
end
