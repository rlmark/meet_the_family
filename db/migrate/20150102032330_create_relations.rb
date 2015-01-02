class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :relative_id
      t.integer :familymember_id
      t.boolean :divorced
      t.boolean :step
      t.string :title

      t.timestamps
    end
  end
end
