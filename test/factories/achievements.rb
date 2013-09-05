# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achievement, class: Achievement do
    name "One point achievement"
    worth_points 1
    repeatable true

    factory :exercise do
      name "Exercised according to plan"
      worth_points 10
      repeatable true
    end
    factory :asana_task_achievement do
      name "Did one task from Asana"
      worth_points 2
      repeatable true
    end
  end
end
