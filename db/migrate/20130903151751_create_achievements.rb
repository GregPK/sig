class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.integer :worth_points
      t.boolean :repeatable

      t.timestamps
    end
    add_reference :achievements, :achiever, index:true
  end
end
