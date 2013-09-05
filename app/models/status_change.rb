class StatusChange < ActiveRecord::Base
  belongs_to :achiever, inverse_of: :status_changes
  #attr_accessor :point_change, :points_after, :ts, :comment, :source

end
