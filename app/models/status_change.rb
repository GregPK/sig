class StatusChange < ActiveRecord::Base
  belongs_to :achiever, inverse_of: :status_changes

  before_save :default_ts

  def default_ts
    self.ts ||= Time.now
  end
end
