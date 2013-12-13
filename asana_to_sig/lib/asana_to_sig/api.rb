require 'json'
require "net/https"


module AsanaToSig
  class API

    def initialize(asana_key)
      @asana_api_key = asana_key
      @tasks = Tasks.new(self)
    end
    
    def make_request(endpoint,params = [])
      # set up HTTPS connection
      uri = URI("https://app.asana.com/api/1.0/#{endpoint}")
  
      params_default =  { 
        :assignee => "me", 
        :opt_pretty => true, 
      }
      
      params = params_default.merge(params)
      
      uri.query = URI.encode_www_form(params)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  
      req = Net::HTTP::Get.new(uri)
      req.basic_auth(@asana_api_key, '')
      
      # issue the request
      res = http.start { |http_stream| http_stream.request(req) }
      
      yield(asana_response(res))
    end
    
    def asana_response(res)
      AsanaResponse.new(res)
    end
    
    def get_completed_for_time(workspace_id,time_range)
      @tasks.completed_for_workspace(workspace_id,time_range)
    end
    
    def get_completed_from_last_given_minutes(workspace_id,minutes)
      start_time = Time.now - 60*minutes.to_i
      end_time = Time.now
      get_completed_for_time(workspace_id,start_time..end_time)
    end

  end
end