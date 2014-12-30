class AddRelativeKeyToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :relative_id, :integer
  end
end
