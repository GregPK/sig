# == Schema Information
#
# Table name: achievers
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  asana_sync_enabled :boolean
#  asana_api_key      :string(255)
#  asana_workspace_id :string(255)
#  asana_last_synced  :datetime
#

class Achiever < ActiveRecord::Base
  has_many :status_changes, -> { order created_at: :desc, id: :desc }, dependent: :destroy

  def points
    if @points.nil?
      if status_changes.nil? || status_changes.size == 0
        @points = 0
      else
        first_sc = status_changes.sort_by{ |a| [a.created_at,a.id] }.reverse.first
        @points = first_sc.points_after
      end
    end
    @points
  end

  def add_status_change(new_status)
    status_changes << new_status
    new_status.points_after
    @points = nil
    new_status
  end

  def change_points(points_delta, source = "unknown", ts = nil)
    points_now = points
    points_after = points_now+points_delta

    new_status = StatusChange.create( point_change:points_delta, points_after: points_after, source: source, ts: ts )
    add_status_change(new_status)
  end

  def use(point_change_item)
    source = "#{point_change_item.name}"
    change_points(point_change_item.points, source)
  end

end
