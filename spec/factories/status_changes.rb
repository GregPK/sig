FactoryGirl.define do
  factory :status_change, class: StatusChange do
    point_change 1
    ts Time.now()

    factory :hundred_status_change do
      point_change 100
      points_after 100
      comment "This cuks"
    end
    
    factory :ten_points_now do
      point_change 5
      points_after 5
    end

  end
end
