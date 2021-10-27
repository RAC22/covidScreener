class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :attestation
      t.integer :user_id

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
