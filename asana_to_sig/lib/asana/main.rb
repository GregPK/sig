require "rubygems"
require "json"
require "net/https"
require_relative "task"

workspace_id = "498346170860"


module AsanaAPI
  class AsanaAPI
    

    
    def initialize(api_key = nil)

    end

    def setup(api_key)
    end

    def request_uri() 

    end

    def get_all(response_body, resource_class)

    end

    def tasks_from_workspace(workspace_id)
      api_key = "**ASANA_API_KEY**"
      # set up HTTPS connection
      uri = URI("https://app.asana.com/api/1.0/tasks")
      opt_fields = "name,completed_at,notes"

      params =  { 
        :workspace => workspace_id, 
        :assignee => "me", 
        :opt_pretty => true, 
        :opt_fields => opt_fields, 
        :include_archived => "1" 
      }
      
      uri.query = URI.encode_www_form(params)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER

      req = Net::HTTP::Get.new(uri)
      req.basic_auth(api_key, '')
      
      # issue the request
      res = http.start { |http_stream| http_stream.request(req) }

      # output
      body = JSON.parse(res.body)
      if body['errors'] then
          puts "Server returned an error: #{body['errors'][0]['message']}"
      else
          tasks = body['data']
          completed_all = 0
          completed_today = 0
          incomplete = 0
          tasks.each do |task|
              task = Task.new(task)
              p task
              if task.completed
                  completed_all += 1
              else
                  incomplete += 1
              end
          end
      end
      puts "Found: \n  #{completed_all} completed all,\n  #{completed_today} completed today\n  #{incomplete} incomplete"

    end
  end
end

    

