class RewardsController < ApplicationController
  respond_to :json

  def index
    @all = Reward.all

    render json: @all
  end
end
