class HomeController < ApplicationController
  def index 
    @achievements = Achievement.all
    @rewards = Reward.all
    @achiever = Achiever.first
  end
end
