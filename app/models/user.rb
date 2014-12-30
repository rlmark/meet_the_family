class User < ActiveRecord::Base
  has_secure_password
  belongs_to :relative

  validates_presence_of :firstname, :lastname, :username, :password, :password_confirmation
  validates :username, uniqueness: true, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  def is_a_relative
    me = Relative.create( firstname: self.firstname,
                          lastname: self.lastname)
    self.relative = me
    self.save
  end
end
