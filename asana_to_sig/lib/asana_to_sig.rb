
require 'json'
require "net/https"

require_relative 'asana/task'

module AsanaToSig
  class AsanaToSig
    attr_reader :tasks

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
        :include_archived => "1" 
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
    end
    
  end
end
