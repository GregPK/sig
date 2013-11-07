class AchievementsController < ApplicationController
  respond_to :json

  def index
    @all = Achievement.all

    render json: @all
  end
end
