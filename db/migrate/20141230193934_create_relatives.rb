class CreateRelatives < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
      t.string :firstname
      t.string :lastname
      t.string :pronouns
      t.text :notes
      t.text :likes
      t.text :dislikes

      t.timestamps
    end
  end
end
