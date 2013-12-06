module AsanaToSig
  class AsanaResponse
    attr_reader :data
    
    def initialize(net_response)
      @body = parse_response(net_response.body)
      @data = @body['data']
    end
    
    def parse_response(json)
      body = JSON.parse(json)
      raise "Server returned an error: #{body['errors'][0]['message']}" if body['errors']
      body
    end
  end
end