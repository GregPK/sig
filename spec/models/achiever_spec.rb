# == Schema Information
#
# Table name: achievers
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  asana_sync_enabled :boolean
#  asana_api_key      :string(255)
#  asana_workspace_id :string(255)
#

require 'spec_helper'

describe Achiever do

  before do
    @achiever = FactoryGirl.create(:zero_point_achiever)
  end

  describe "when changing points" do
    it "should have 0 point at start" do
      expect(@achiever.points).to be 0
    end
   
    it "should properly add points when new" do
      @achiever.change_points(10)
      expect(@achiever.points).to be 10
    end 

    it "should properly add points when points exist" do
      @achiever.change_points(10)
      @achiever.change_points(5)
      expect(@achiever.points).to be 15
    end
  end

  describe "when achieving stuff" do
    it "should gain points for every achievement" do
      expect(@achiever.points).to be 0
     
      achievement = FactoryGirl.create(:achievement)
      @achiever.use(achievement)
      expect(@achiever.points).to be 1 
    end
  end

  describe "when being rewarded" do
    it "should substract points for every reward given" do
      achiever = FactoryGirl.create(:hundred_point_achiever)
      expect(achiever.points).to be 100
     
      reward = FactoryGirl.create(:ten_point_reward)
      achiever.use(reward)

      expect(achiever.points).to be 90
    end
  end
  describe "when being punished" do
    it "should substract points for every punishment" do
      achiever = FactoryGirl.create(:hundred_point_achiever)
      expect(achiever.points).to be 100
     
      punishment =  FactoryGirl.create(:ten_point_punisher)
      achiever.use(punishment)

      expect(achiever.points).to be 90
    end
  end
end
