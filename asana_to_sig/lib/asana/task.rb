require 'date'
require 'time'

module AsanaToSig
  class Task
    attr_accessor :name, :completed_at, :created_at, :manado

    def initialize(data)
      data.each_pair do |k,v|
        instance_variable_set("@#{k}",v)
      end
      @completed_at = Time.parse(@completed_at) if @completed_at
    end

    def completed?
      not @completed_at
    end
      
    def completed_between?(first_time, second_time)
      return false unless completed?
      first_time < @completed_at && second_time > @completed_at
    end
    
    def completed_today?(today_is = nil)
      return false unless completed?
      today_is ||= Date.today
      completed_between?(today_is.to_time,today_is.next_day.to_time)
    end
  end
end
