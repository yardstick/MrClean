class AddNumberOfAssignmentsToOffice < ActiveRecord::Migration[5.1]
  def change
    add_column :offices, :num_assignments_per_week, :integer
  end
end
