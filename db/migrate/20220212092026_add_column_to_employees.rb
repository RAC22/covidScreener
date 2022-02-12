class AddColumnToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :signed_in, :boolean
  end
end
