class AsanaSyncService
  attr_reader :achiever, :tasks_synced, :point_change
  
  def initialize(achiever,logger = Naught.build.new)
    @achiever = achiever
    @api_key = achiever.asana_api_key
    @workspace_id = achiever.asana_workspace_id
    @logger = logger
    @tasks_synced = 0
    @point_change = 0
  end

  def sync(asana_sync_provider = AsanaToSig::CLI, clock = DateTime)
    last_sync = @achiever.asana_last_synced || Time.at(0)
    time_now = clock.now
    timespan = [last_sync, time_now]
    
    cli = asana_sync_provider.new(@api_key)
    
    binding.pry
    tasks = cli.get_completed_between(@workspace_id,timespan)

    if tasks.size > 0
      @logger.info "Found #{tasks.size} new done tasks in timespan #{timespan}"
      tasks.each do |task|
        sync_task(task)
      end
    end
    
    @logger.info "Ending sync and setting last sync time to [#{time_now}]"
    achiever.asana_last_synced = time_now
  end
  
  def sync_task(task)
    @logger.info "Synchronizing task [#{task.name}], completed at [#{task.completed_at}] for [#{task.manado}] points"
    @achiever.change_points(task.manado, name_from_task(task), task.completed_at)
    @logger.info "  Success... Points for [#{achiever.name}] after task: [#{achiever.points}]"
    @tasks_synced += 1
    @point_change += task.manado
  end
  
  def name_from_task(task)
    "Asana: [#{task.name}]"
  end
end
  