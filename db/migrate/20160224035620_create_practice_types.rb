class CreatePracticeTypes < ActiveRecord::Migration
  def change
    create_table :practice_types do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
