class CreateStatusChanges < ActiveRecord::Migration
  def change
    create_table :status_changes do |t|
      t.string :source
      t.text :comment
      t.integer :point_change
      t.datetime :ts

      t.timestamps
    end
    add_reference :status_changes, :achiever, index:true
  end
end
