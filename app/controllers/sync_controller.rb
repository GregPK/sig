require 'stringio'

class SyncController < ApplicationController
  attr_accessor :sync_service_provider
  def initialize(sync_service_provider = AsanaSyncService)
    @sync_service_provider = sync_service_provider
  end
  
  def all
    strio = StringIO.new
    logger = ActiveSupport::Logger.new strio
    
    sync_achievers = achievers
      
    sync_achievers.each do |achiever|
      service = @sync_service_provider.new(achiever,logger)
      service.sync
      achiever.save
    end
    
    render json: strio.string 
  end
  
  def achievers
    Achiever.where(asana_sync_enabled: true)
  end
end