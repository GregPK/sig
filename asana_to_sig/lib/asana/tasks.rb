require 'date'
require 'time'

module AsanaToSig
  class Tasks
    
    def initialize(asana_api)
      @asana_api = asana_api
    end
    
    def from_json(json)
      body = JSON.parse(json)
      if body['errors'] then
          puts "Server returned an error: #{body['errors'][0]['message']}"
      else
          tasks = body['data']
          tasks.map! {|t| Task.new(t) }
      end
      tasks
    end

    def for_workspace(workspace_id, time_range = nil)
      params =  { 
        :workspace => workspace_id, 
        :opt_fields => "name,completed_at,notes", 
      }

      res = @asana_api.make_request('tasks',params)
      tasks = from_json(res.body)
      
      if time_range
        tasks.keep_if { |t| t.completed_between?(time_range.first,time_range.last) }
      end
      
      tasks
    end
  end
end
