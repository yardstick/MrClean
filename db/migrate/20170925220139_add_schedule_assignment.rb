class AddScheduleAssignment < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.belongs_to :week, null: false
      t.belongs_to :employee, null: false

      t.timestamps

    end
    
    add_index :assignments, [:week_id, :employee_id]
  end
end
