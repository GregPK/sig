# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ten_point_punisher, class: Punisher do
    points(-10)
  end
end
