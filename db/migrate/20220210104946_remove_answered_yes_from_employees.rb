class RemoveAnsweredYesFromEmployees < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :answered_yes, :string
  end
end
