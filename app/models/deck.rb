class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :relatives

  validates :name, presence: true, on: :create
end
