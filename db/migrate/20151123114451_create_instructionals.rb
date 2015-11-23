class CreateInstructionals < ActiveRecord::Migration
  def change
    create_table :instructionals do |t|
      t.string :title
      t.string :subtitle
      t.text :text

      t.timestamps null: false
    end
  end
end
