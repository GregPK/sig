require 'spec_helper'

NullObject = Naught.build do |config|
  config.define_explicit_conversions
end

describe SyncController do
  before :each do 
    controller.sync_service_provider = Naught.build 
  end
  
  describe "syncing all users" do
    it "responds with an empty log when given to users" do
      expect(controller).to receive(:achievers).and_return([])
      xhr :post, :all, format: :js

      expect(response.success?).to be true
      expect(response.body).to eq ""
    end
    
    it "responds with the sync log when given achievers" do
      expect(controller).to receive(:achievers).and_return([NullObject.new])
      xhr :post, :all, format: :js
      
      expect(response.success?).to be true
      expect(response.body).to be_an_instance_of String
    end
  end
end