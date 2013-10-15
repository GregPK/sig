
module AsanaApi
  class Task
      attr_accessor :name, :completed_at, :created_at

      def initialize(data)
          data.each_pair do |k,v|
              instance_variable_set("@#{k}",v)
          end
      end

      def completed 
          not @completed_at.nil?
      end

  end
end
