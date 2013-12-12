module AsanaSync
  class AsanaSyncService
    def initialize(api_key, workspace_id)
      @api_key = api_key
      @workspace_id = workspace_id
    end

    def sync(clock = DateTime)
      sync_time = SyncTime.new
      time_now = clock.now
      timespan = [sync_time.get_last, time_now]
      
      cli = AsanaToSig::CLI.new(@api_key)
      
      tasks = cli.get_completed_between(@workspace_id,timespan)

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
  