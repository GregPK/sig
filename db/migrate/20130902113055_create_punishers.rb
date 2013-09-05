class CreatePunishers < ActiveRecord::Migration
  def change
    create_table :punishers do |t|
      t.string :name
      t.integer :point_change

      t.timestamps
    end
    add_reference :punishers, :achiever, index:true
  end
end
