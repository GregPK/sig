require 'stringio'

class SyncController < ApplicationController
  def all
    strio = StringIO.new
    logger = ActiveSupport::Logger.new strio
    
    sync_achievers = Achiever.where(asana_sync_enabled: true)
      
    sync_achievers.each do |achiever|
      service = AsanaSyncService.new(achiever,logger)
      service.sync
      achiever.save
    end
    
    
    render json: strio.string 
  end
end