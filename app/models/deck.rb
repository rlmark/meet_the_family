class Deck < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, on: :create
end
