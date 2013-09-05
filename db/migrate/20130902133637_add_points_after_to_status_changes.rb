class AddPointsAfterToStatusChanges < ActiveRecord::Migration
  def change
    add_column :status_changes, :points_after, :integer
  end
end
