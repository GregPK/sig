# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ten_point_reward, class: Reward do
    cost 10

    factory :qi do
      name "Watch an episode of QI"
      cost 6
    end

    factory :fifa do
      name "Play a game in FIFA"
      cost 3
    end

    factory :scrolls do 
      name "Play 0,5h of scrolls"
      cost 4
    end
  end


end
