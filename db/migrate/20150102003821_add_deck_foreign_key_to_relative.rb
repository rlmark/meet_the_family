class AddDeckForeignKeyToRelative < ActiveRecord::Migration
  def change
    add_column :relatives, :deck_id, :integer
  end
end
