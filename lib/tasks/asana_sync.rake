
namespace :asana do
  namespace :sync do
    desc "Print the last sync time"
    task :print_last_sync do 
      time = AsanaSync::SyncTime.new
      puts time.get_last
    end
    
    desc "Sets the last sync time to now, usually used only when a hand-sync was done"
    task :update_last_sync do 
      time = AsanaSync::SyncTime.new
      time.set_last(Time.now)
      puts time.get_last
    end
    
    task :all => :environment do
      asana_key = "**ASANA_API_KEY**" 
      workspace_id = "7566362730570"
      
      logger = ActiveSupport::Logger.new(STDOUT)
      service = AsanaSync::AsanaSyncService.new(asana_key,workspace_id,logger)
      service.sync
    end
      
  end
end
