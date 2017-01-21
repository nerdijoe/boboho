require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true

  validates :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "invalid email" }
  validates :email, uniqueness: true

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { in: 6..20 }
  validates_confirmation_of :password



end
