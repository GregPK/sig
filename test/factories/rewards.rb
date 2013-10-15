# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ten_point_reward, class: Reward do
    points(-10)

    factory :qi do
      name "Watch an episode of QI"
      points(-6)
    end

    factory :fifa do
      name "Play a game in FIFA"
      points(-3)
    end

    factory :scrolls do 
      name "Play 0,5h of scrolls"
      points(-4)
    end
  end


end
