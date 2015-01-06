class AddPhotoToRelative < ActiveRecord::Migration
  def change
    add_column :relatives, :avatar, :string
  end
end
