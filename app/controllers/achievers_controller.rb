class AchieversController < ApplicationController
  respond_to :json

  def show_current
    @all = Achiever.find_by name: "GK"

    render json: @all
  end
end
