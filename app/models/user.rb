require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_secure_password

  has_many :listings, :dependent => :destroy
  has_many :authentications, :dependent => :destroy

  mount_uploader :profile_pic, ImageUploader

  validates :firstname, presence: true
  validates :lastname, presence: true

  validates :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "invalid email" }
  validates :email, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true


  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, if: :password
  validates :password_confirmation, presence: true, on: :create


  # validates :password, length: { in: 6..20 }
  validates_confirmation_of :password, if: :password

  enum role: [ :normal, :admin, :superadmin ]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :normal
  end



  def self.create_with_auth_and_hash(authentication, auth_hash)
    create! do |u|
      u.firstname = auth_hash["extra"]["raw_info"]["name"]
      u.lastname = auth_hash["extra"]["raw_info"]["name"]
      u.username = auth_hash["extra"]["raw_info"]["id"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.email = auth_hash.uid + '@twitter.com' if auth_hash.provider == 'twitter'
      u.authentications << (authentication)
      u.password = SecureRandom.hex(3)
      u.password_confirmation = u.password
      u.profile_pic = auth_hash['info']['image']
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end



end
