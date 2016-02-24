class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :job
      t.text :info

      t.timestamps null: false
    end
  end
end
