class AddEmployee < ActiveRecord::Migration[5.1]
  def change
  	create_table :employees do |t|
  		t.string :first_name, null: false
  		t.string :last_name, null:false
  		t.string :email
  		t.string :phone

  		t.timestamps
  	end
  end
end
