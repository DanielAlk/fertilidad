class CreateImageGalleries < ActiveRecord::Migration
  def change
    create_table :image_galleries do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
