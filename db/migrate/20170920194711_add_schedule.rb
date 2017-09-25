class AddSchedule < ActiveRecord::Migration[5.1]
  def change
  	create_table :schedules do |t|
  		t.integer :start_year
  		t.integer :start_month
  		t.integer :start_day

  		t.belongs_to :employee1
  		t.belongs_to :employee2

  		t.timestamps
  	end
  end
end
