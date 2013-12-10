require_relative './sync_time'

namespace :asana do
  namespace :sync do
    desc "Print the last sync time"
    task :print_last_sync do 
      time = SyncTime.new
      puts time.get_last
    end
    
    desc "Sets the last sync time to now, usually used only when a hand-sync was done"
    task :update_last_sync do 
      time = SyncTime.new
      puts time.set_last(Time.now)
      puts time.get_last
    end
    
    task :all => :environment do
      sync_time = SyncTime.new
      asana_key = "**ASANA_API_KEY**" 
      workspace_id = "7566362730570"
      time_now = Time.now
    
      cli = AsanaToSig::CLI.new(asana_key)
      timespan = [sync_time.get_last, time_now]
      tasks = cli.get_completed_between(workspace_id,timespan)
    
      if tasks.size > 0
        achiever = Achiever.find(1)
        
        puts "Found #{tasks.size} new done tasks in timespan #{timespan}"
        tasks.each do |task|
          puts "Synchronizing task [#{task.name}], completed at [#{task.completed_at}] for [#{task.manado}] points"        
          achievement = Achievement.new(achiever: achiever, name:"Asana: [#{task.name}]", points: task.manado)
          achiever.use(achievement)
          puts "  Success... Points for [#{achiever.name}] after task: [#{achiever.points}]"
        end
      end
      
      puts "Ending sync and setting last sync time to [#{time_now}]"
      sync_time.set_last(time_now)
    end
      
  end
end
