class AddAnsweredYesToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :answered_yes, :string
  end
end
