class UserBreed < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed
end
