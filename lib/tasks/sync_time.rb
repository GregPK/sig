class SyncTime
  LAST_SYNC_FILENAME = File.expand_path("../../../tmp/pids/asana_sync_ts.txt", __FILE__)

  def get_last
      @file = File.open(LAST_SYNC_FILENAME,"a+")
      time_str = @file.readlines.first if @file
      
      begin 
        time = Time.parse time_str
      rescue
        puts "Could not parse time from file [#{LAST_SYNC_FILENAME}], (first line: [#{time_str}]), defaulting to current time (no sync will be made)"
        time = Time.now
        set_last(time)
      end
      time
  end
  
  def set_last(time)
    set_content(time.to_s)
  end
  
  private
  
  def set_content(str)
    @file = File.open(LAST_SYNC_FILENAME,"a+") unless @file
    @file.truncate(0)
    @file.write(str)
    @file.close
  end
end      