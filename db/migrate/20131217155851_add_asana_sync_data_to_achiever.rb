class AddAsanaSyncDataToAchiever < ActiveRecord::Migration
  def change
    add_column :achievers, :asana_sync_enabled, :boolean
    add_column :achievers, :asana_api_key, :string
    add_column :achievers, :asana_workspace_id, :string
    reversible do |dir|
      dir.up { Achiever.update_all asana_sync_enabled: 'false' }
    end
  end
end
