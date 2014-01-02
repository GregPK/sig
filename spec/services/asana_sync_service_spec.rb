require 'spec_helper'

describe AsanaSyncService do
  let(:last_sync_was) { Time.now-(60*5) }
  let(:once_was) { Time.now-(60*2) }
  let(:now_is) { Time.now-(60*0) }
  
  subject do 
    achiever = OpenStruct.new
    achiever.asana_last_synced = last_sync_was
    expect(achiever).to receive(:asana_api_key).and_return(:nil)
    expect(achiever).to receive(:asana_workspace_id).and_return(nil)
    allow(achiever).to receive(:change_points).and_return(nil)

    AsanaSyncService.new(achiever)
  end
  
  describe "#initialize" do
    it "should setup basic vars" do
      expect(subject.achiever).to_not be_nil
    end
  end
  
  before(:each) do
    @mock_task = double("Task")
    allow(@mock_task).to receive(:manado)        { 1 }
    allow(@mock_task).to receive(:name)          {"Mock task"}
    allow(@mock_task).to receive(:completed_at)  { once_was }
    
    @sync_provider = double("SyncProvider")
    expect(@sync_provider).to receive(:get_completed_between).and_return([@mock_task])
    
    @sync_provider_klass = double("SyncProviderClass")
    expect(@sync_provider_klass).to receive(:new).and_return(@sync_provider)
    
    subject.sync(@sync_provider_klass,Time)    
  end
  
  describe "#sync" do

    it "should properly count the tasks and points" do 
      expect(subject.tasks_synced).to eq 1
      expect(subject.point_change).to eq 1
    end
    
    it "should update the last sync date on the achiever" do
      expect(subject.achiever.asana_last_synced.to_i).to eq now_is.to_i
    end
  end
end