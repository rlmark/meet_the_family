class Relation < ActiveRecord::Base
  belongs_to :relative
  belongs_to :familymember, class_name: "Relative"
end
