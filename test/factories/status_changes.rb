FactoryGirl.define do
  factory :status_change, class: StatusChange do
    point_change 1
    ts Time.now()

    factory :hundred_status_change do
      point_change 100
      points_after 100
      comment "This cuks"
    end
  end
end
