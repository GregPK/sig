require 'date'
require 'time'

module AsanaToSig
  class Tasks
    attr_reader :tasks
    
    def initialize(asana_api)
      @asana_api = asana_api
    end
    
    def set_tasks_from_data(data)
      @tasks = []
      data.each { |task_data| @tasks << Task.new(task_data) }
    end
    
    def completed_for_workspace(workspace_id, time_range = nil)
      @asana_api.make_request('tasks',request_params(workspace_id)) do |asana_response|
        set_tasks_from_data asana_response.data
      end
      filtered = filter_for_time(@tasks,time_range)
      filtered
    end
    
    def request_params(workspace_id)
      params =  { 
        :workspace => workspace_id, 
        :opt_fields => "name,completed_at,notes", 
      }
    end

    def filter_for_time(tasks,time_range)
      time_range = maximum_time_span unless time_range
      tasks.select { |t| t.completed_between?(time_range.first,time_range.last) }
    end
    
    def maximum_time_span
      Time.at(0) .. Time.parse('2039-12-30')
    end
    
  end
end
