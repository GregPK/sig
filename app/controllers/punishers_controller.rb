class PunishersController < ApplicationController
  respond_to :json

  def index
    @all = Punisher.all

    render json: @all
  end
end
