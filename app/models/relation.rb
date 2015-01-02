class Relation < ActiveRecord::Base
  belongs_to :relative
  belongs_to :familymember, class_name: "Relative"

  TITLES = %w(Mother Father Sister Brother Uncle Aunt Cousin Grandmother Grandfather Great-aunt Great-uncle Great-grandfather Great-grandmother )
end
