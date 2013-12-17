require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'test_helper'

#FactoryGirl.find_definitions

class AchieverTest < ActiveSupport::TestCase

  before do
    @achiever = FactoryGirl.create(:zero_point_achiever)
  end

  describe "when changing points" do
    it "should have 0 point at start" do
      @achiever.points.must_equal 0
    end
   
    it "should properly add points when new" do
      @achiever.change_points(10)
      @achiever.points.must_equal 10
    end 

    it "should properly add points when points exist" do
      @achiever.change_points(10)
      @achiever.change_points(5)
      @achiever.points.must_equal 15
    end
  end

  describe "when achieving stuff" do
    it "should gain points for every achievement" do
      @achiever.points.must_equal 0
     
      achievement = FactoryGirl.create(:achievement)
      @achiever.use(achievement)
      @achiever.points.must_equal 1 
    end
  end

  describe "when being rewarded" do
    it "should substract points for every reward given" do
      achiever = FactoryGirl.create(:hundred_point_achiever)
      achiever.points.must_equal 100
     
      reward = FactoryGirl.create(:ten_point_reward)
      achiever.use(reward)

      achiever.points.must_equal 90
    end
  end
  describe "when being punished" do
    it "should substract points for every punishment" do
      achiever = FactoryGirl.create(:hundred_point_achiever)
      achiever.points.must_equal 100
     
      punishment =  FactoryGirl.create(:ten_point_punisher)
      achiever.use(punishment)

      achiever.points.must_equal 90
    end
  end
end
