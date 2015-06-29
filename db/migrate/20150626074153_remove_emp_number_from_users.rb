class RemoveEmpNumberFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :emp_number
  end
end
