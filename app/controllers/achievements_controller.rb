class AchievementsController < ApplicationController
  include UsableByAchiever
  respond_to :json
 
  def index
    p model_class
    p Achievement.all
    p model_class.all
    @all = model_class.all
    respond_with(@all)
  end
end
