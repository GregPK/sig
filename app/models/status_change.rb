# == Schema Information
#
# Table name: status_changes
#
#  id           :integer          not null, primary key
#  source       :string(255)
#  comment      :text
#  point_change :integer
#  ts           :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  achiever_id  :integer
#  points_after :integer
#
# Indexes
#
#  index_status_changes_on_achiever_id  (achiever_id)
#

class StatusChange < ActiveRecord::Base
  belongs_to :achiever, inverse_of: :status_changes

  before_save :default_ts

  def default_ts
    self.ts ||= Time.now
  end
end
