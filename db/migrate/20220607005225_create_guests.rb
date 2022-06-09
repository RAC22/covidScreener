class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :answered_yes
      t.integer :user_id

      t.timestamps
    end
    add_index :guests, :user_id
  end
end
