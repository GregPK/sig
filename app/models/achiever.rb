class Achiever < ActiveRecord::Base
  has_many :status_changes, -> { order ts: :desc }, dependent: :destroy

  def points
    if @points.nil?
      if status_changes.nil? || status_changes.size == 0
        @points = 0
      else
        first_sc = status_changes.first
        @points = first_sc.points_after
      end
    end
    @points
  end

  def add_status_change(new_status)
    status_changes << new_status
    @points = new_status.points_after
    new_status
  end

  def change_points(points_delta, source = "unknown")
    points_now = points
    points_after = points_now+points_delta

    new_status = StatusChange.create( point_change:points_delta, points_after: points_after, source: source )
    add_status_change(new_status)
  end

  def use(point_change_item)
    source = "#{point_change_item.name}"
    change_points(point_change_item.points, source)
  end

end
