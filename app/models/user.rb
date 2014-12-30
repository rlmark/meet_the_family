class User < ActiveRecord::Base
  has_secure_password

  validates :firstname, :lastname, :username, :password, :password_confirmation, presence: true, on: :create
  validates :username, :password, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
