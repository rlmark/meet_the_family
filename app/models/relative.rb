class Relative < ActiveRecord::Base
  has_one :user
  belongs_to :deck
end
