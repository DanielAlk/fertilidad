class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :title
      t.string :info
      t.references :practice_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
