
namespace :asana do
  namespace :sync do
   desc "Sync all users now"
    task :all => :environment do
      logger = ActiveSupport::Logger.new(STDOUT)
      
      sync_achievers = Achiever.where(asana_sync_enabled: true)
      
      sync_achievers.each do |achiever|
        service = AsanaSyncService.new(achiever,logger)
        service.sync
        achiever.save
      end
    end
      
  end
end
