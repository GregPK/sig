require 'spec_helper'
require 'json'

describe StatusChangesController do

  describe "when using a Reward" do
    it "responds with the status change" do
      xhr :post, :create_from_reward, {:id => '1'}, format: :js
      
      expect(response.success?).to be true
      stat_change = JSON.parse(response.body)['status_change']
      
      expect(stat_change["id"]).not_to be_nil
      expect(stat_change["points_after"]).not_to be_nil
      expect(stat_change["point_change"]).not_to be_nil
      expect(stat_change["point_change"]).to be <= 0
    end
  end
  
  describe "when using a Punisher" do
    it "responds with the status change" do
      xhr :post, :create_from_punishment, {:id => '1'}, format: :js
      expect(response.success?).to be true
      stat_change = JSON.parse(response.body)['status_change']
      
      expect(stat_change["id"]).not_to be_nil
      expect(stat_change["points_after"]).not_to be_nil
      expect(stat_change["point_change"]).not_to be_nil
      expect(stat_change["point_change"]).to be <= 0
    end
  end
  
  describe "when achieved and Achievement" do
    it "responds with the status change" do
      xhr :post, :create_from_achievement, {:id => '1'}, format: :json
      
      expect(response.success?).to be true
      stat_change = JSON.parse(response.body)['status_change']
      
      expect(stat_change["id"]).not_to be_nil
      expect(stat_change["points_after"]).not_to be_nil
      expect(stat_change["point_change"]).not_to be_nil
      expect(stat_change["point_change"]).to be >= 0
    end
  end
  
  describe "when listing status changes" do
    it "responds with the status change array" do
      xhr :post, :index, format: :js
      
      expect(response.success?).to be true
      stat_changes = JSON.parse(response.body)['status_changes']
      
      expect(stat_changes.size).to be > 0
    end
  end

end
