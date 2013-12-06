module AsanaToSig
  class CLI

    def initialize(asana_key)
      @asana_key = asana_key
    end

    def get_achievements_5mins(workspace_id)
      check_completed(@asana_key, sig_user_id, workspace_id, 5)
    end
    
    def get_completed(workspace_id, minutes)
      a2s = AsanaToSig::API.new(@asana_key)
      a2s.get_completed_from_last_given_minutes(workspace_id,minutes)
    end
    
    def get_completed_between(workspace_id, time_range)
      a2s = AsanaToSig::API.new(@asana_key)
      a2s.get_completed_for_time(workspace_id,time_range)
    end

  end
end