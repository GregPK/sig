require 'test_helper'
require 'pry'

require_relative '../lib/asana/task'
require_relative '../lib/asana/tasks'

class AsanaTasksSpec < MiniTest::Spec
  before do
    secs_in_min = 60

    @now = now = Time.now

    @tasks = [
      { name: "Not completed 1", completed_at: nil },
      { name: "Not completed 2", completed_at: nil },
      { name: "Completed just now 1", completed_at: now.to_s },
      { name: "Completed just now 2", completed_at: (now - Random.rand(10)).to_s },
      { name: "Completed just now 3", completed_at: (now - Random.rand(30)).to_s },
      { name: "Completed 3 minutes ago ", completed_at: (now - 3*secs_in_min - Random.rand(10)).to_s },
      { name: "Completed 6 minutes ago ", completed_at: (now - 6*secs_in_min - Random.rand(10)).to_s },
    ]

    #@a2s = AsanaToSig::AsanaToSig.new('ASANA_API_KEY')
    @a2s = MiniTest::Mock.new
    
    #stub to return the tasks
    response = MiniTest::Mock.new
    response.expect(:body, {data: @tasks}.to_json )
    @a2s.expect(:make_request,response,[String,Hash])

    @tasks_repo = AsanaToSig::Tasks.new(@a2s)
  end

  describe '#for_workspace' do
    it "should return all tasks when not given a date" do
        tasks = @tasks_repo.for_workspace(nil)
        tasks.size.must_equal(@tasks.size)
    end
    
    it "should return 5 tasks when querying for completed in all of time" do
      all_eternity = Time.at(0) .. Time.parse('2039-12-30')
      tasks = @tasks_repo.for_workspace(nil,all_eternity)
      tasks.size.must_equal(5)
    end
    
    it "should return 3 tasks when querying for completed the last minute" do
      last_minute = [@now-60,@now]
      tasks = @tasks_repo.for_workspace(nil,last_minute)
      tasks.size.must_equal(3)
    end
    
    it "should return 4 tasks when querying for completed the last 4 minutes" do
      time_range = [@now-4*60,@now]
      tasks = @tasks_repo.for_workspace(nil,time_range)
      tasks.size.must_equal(4)
    end
    
    it "should return 5 tasks when querying for completed the last 7 minutes" do
      time_range = [@now-7*60,@now]
      tasks = @tasks_repo.for_workspace(nil,time_range)
      tasks.size.must_equal(5)
    end
  end
end
