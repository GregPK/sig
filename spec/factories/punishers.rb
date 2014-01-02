# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ten_point_punisher, class: Punisher do
    name "Generic ten point punisher"  
    points -10
    
    factory :unhealthy_food do
      name "Ate unhealthy food or drink (500 cals)"
      points -5
    
    
    end
  end
end
