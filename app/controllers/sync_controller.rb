require 'stringio'

class SyncController < ApplicationController
  def all
    strio = StringIO.new
    logger = ActiveSupport::Logger.new strio
    
    achiever = current_user
    service = AsanaSync::AsanaSyncService.new(achiever,logger)
    service.sync
    render json: strio.string 
  end
end