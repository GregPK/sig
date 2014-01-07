require 'spec_helper'

describe ApplicationController do
 describe "#current_achiever" do
   it "always returns the save achiever (id=1)" do
     t = ApplicationController.new
     expect(t.current_achiever).to be_an_instance_of(Achiever) 
   end
 end
  
 describe "#model_class" do
    it "Returns `Achievement` for the `AchievementsController` controller" do
      t = AchievementsController.new
      expect(t.model_class).to eq Achievement
    end
    
    it "Returns `Reward` for the `RewardsController` controller" do
      t = RewardsController.new
      expect(t.model_class).to eq Reward
    end
  end
end
