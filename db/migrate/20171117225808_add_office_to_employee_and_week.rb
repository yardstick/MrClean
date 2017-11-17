class AddOfficeToEmployeeAndWeek < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :employees, :office, null: false
    add_belongs_to :weeks, :office, null: false
  end
end
