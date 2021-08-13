class User < ApplicationRecord
  has_secure_password
  
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email

  has_many :favorites, dependent: :destroy
end
