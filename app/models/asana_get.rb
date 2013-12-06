class AsanaGet
  def self.sync_1_min
    asana_key = "**ASANA_API_KEY**" 
    workspace_id = "7566362730570"
    t = Time.now
    
    cli = AsanaToSig::CLI.new(asana_key)
    timespan = [Time.at(t-60-t.to_i%60), Time.at(t-t.to_i%60)]
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
    
  end
end
