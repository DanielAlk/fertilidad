class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
