class Relative < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_one :user
  belongs_to :deck
  # This is a self-referential relationship.
  # Familymembers is not an actual model name, it's an alias for Relative.
  has_many :relations
  has_many :familymembers, through: :relations
end
