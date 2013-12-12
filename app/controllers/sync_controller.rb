require 'stringio'

class SyncController < ApplicationController
  def all
    strio = StringIO.new
    logger = ActiveSupport::Logger.new strio
    
    service = AsanaSync::AsanaSyncService.new(params[:api_key],params[:workspace_id],logger)
    service.sync
    render json: strio.string 
  end
end