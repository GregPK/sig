require 'asana'

module AsanaToSig
  class AsanaToSig
    attr_reader :start_ts, :end_ts
    attr_accessor :sig_user_id, :workspace_id

    def initialize(asana_key)
      @asana_api_key = asana_key
      configure()
    end

    def configure()
      Asana.configure do |client|
        client.api_key = @asana_api_key
      end
    end

    def asana_user
      @asana_user = Asana::User.me if @asana_user.nil?
      @asana_user
    end

    def all_for_workspace_id(asana_workspace_id)
      all_for_workspace(Asana::Workspace.find(asana_workspace_id))
    end

    def all_for_workspace(asana_workspace)
      Asana::Workspace.find(@workspace_id).tasks(asana_user.id())
    end

    def get_from_last_given_minutes(minutes)
      tasks = all_for_workspace_id(@workspace_id)
      tasks.each do |task|
        p task
      end
      tasks
    end
  end
end
