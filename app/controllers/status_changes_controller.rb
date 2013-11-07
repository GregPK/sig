class StatusChangesController < ApplicationController
  respond_to :json

  def create_from_reward
    create_from(Reward,params.fetch(:id))
  end

  def create_from_achievement
    create_from(Achievement,params.fetch(:id))
  end

  def create_from_punishment
    create_from(Punisher,params.fetch(:id))
  end

  def create_from(model_klass, id)
      usable = model_klass.find(id)
      new_status_change = usable.achiever.use(usable)
      respond_with(new_status_change)
  end

  def index
    @all = StatusChange.all
    render json: @all.order( "ts" => :desc )
  end

end
