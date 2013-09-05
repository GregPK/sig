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
  end

  def change_points(points_delta, source = "unknown")
    points_now = points
    points_after = points_now+points_delta 

    new_status = StatusChange.create( point_change:points_delta, points_after: points_after, source: source )
    add_status_change(new_status)
  end

  def use_reward(reward)
    source = "Reward: [#{reward.name}]"
    change_points(-reward.cost, source)
    self
  end

  def has_achieved(achievement)
    source = "Achieved: [#{achievement.name}]"
    change_points(achievement.worth_points, source)
    self
  end

  def punish(punisher)
    source = "Punishment for: [#{punisher.name}]"
    change_points(-punisher.point_change, source)
    self
  end


end
