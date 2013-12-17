require 'test_helper'
require 'json'


class StatusChangesControllerSpec < ActionDispatch::IntegrationTest
  before do
   # @item = Factory.create(:item)
  end

  describe "when using a Reward" do
    it "responds with the status change" do
      post "/status_changes/from_reward/1.json"
      response.success?.must_equal true
      stat_change = JSON.parse(body)
      
      stat_change["id"].wont_be_nil
      stat_change["points_after"].wont_be_nil
      stat_change["point_change"].wont_be_nil
      stat_change["point_change"].must_be :<=, 0
    end
  end
  
  describe "when using a Punisher" do
    it "responds with the status change" do
      post "/status_changes/from_punishment/1.json"
      response.success?.must_equal true
      stat_change = JSON.parse(body)
      
      stat_change["id"].wont_be_nil
      stat_change["points_after"].wont_be_nil
      stat_change["point_change"].wont_be_nil
      stat_change["point_change"].must_be :<=, 0
    end
  end
  
  describe "when achieved and Achievement" do
    it "responds with the status change" do
      post "/status_changes/from_achievement/1.json"
      response.success?.must_equal true
      stat_change = JSON.parse(body)
      
      stat_change["id"].wont_be_nil
      stat_change["points_after"].wont_be_nil
      stat_change["point_change"].wont_be_nil
      stat_change["point_change"].must_be :>=, 0
    end
  end

end
