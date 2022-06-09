class AddSignedInToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :signed_in, :boolean
  end
end
