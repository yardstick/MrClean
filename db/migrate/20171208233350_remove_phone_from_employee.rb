class RemovePhoneFromEmployee < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :phone
  end
end
