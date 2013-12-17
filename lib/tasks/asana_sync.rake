
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
    
   desc "Sync all users now"
    task :all => :environment do
      logger = ActiveSupport::Logger.new(STDOUT)
      
      sync_achievers = Achiever.where(asana_sync_enabled: true)
      
      sync_achievers.each do |achiever|
        service = AsanaSync::AsanaSyncService.new(achiever,logger)
        service.sync
      end
    end
      
  end
end
