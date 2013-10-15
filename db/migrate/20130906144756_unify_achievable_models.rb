class UnifyAchievableModels < ActiveRecord::Migration
  def change
    rename_column :rewards, :cost, :points
    rename_column :achievements, :worth_points, :points
    rename_column :punishers, :point_change, :points
  end
end
