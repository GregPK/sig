class AddAsanaLastSyncTsToAchiever < ActiveRecord::Migration
  def change
    add_column :achievers, :asana_last_synced, :datetime
  end
end
