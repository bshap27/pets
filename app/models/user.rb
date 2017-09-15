class User < ActiveRecord::Base
  has_many :breeds

  def initialize(email)
    @email = email
    breeds = []
  end
end
