class StatusChangeSerializer < ActiveModel::Serializer
  attributes :id, :point_change, :points_after, :source, :ts
end