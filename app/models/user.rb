class User < ApplicationRecord

  has_many :appearances
  has_many :episodes, through: :appearances

  has_secure_password

end
