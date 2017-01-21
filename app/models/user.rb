require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_secure_password

  mount_uploader :profile_pic, ImageUploader

  validates :firstname, presence: true
  validates :lastname, presence: true

  validates :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "invalid email" }
  validates :email, uniqueness: true

  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, if: :password
  validates :password_confirmation, presence: true, if: :password
  # validates :password, length: { in: 6..20 }
  # validates_confirmation_of :password



end
