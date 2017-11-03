class AddWeek < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.datetime :starts_at, null: false

      t.belongs_to :office

      t.timestamps
    end
  end
end
