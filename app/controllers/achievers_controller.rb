class AchieversController < ApplicationController
  respond_to :json

  def show_current
    @all = Achiever.find(1)

    render json: @all
  end
end
