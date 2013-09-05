class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :cost

      t.timestamps
    end
    add_reference :rewards, :achiever, index:true
  end
end
