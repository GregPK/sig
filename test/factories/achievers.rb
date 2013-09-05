
FactoryGirl.define do
  factory :zero_point_achiever, class: Achiever do
    name "Zerious"
    
    factory :hundred_point_achiever do
      name "Centinious"
      
      after(:create) do |achiever, evaluator|
        hsc = FactoryGirl.create(:hundred_status_change)
        achiever.status_changes << hsc
      end
    end
    factory :gk do
      name "GK"
      
      after(:create) do |achiever, evaluator|
        # do
      end
    end
  end
end
