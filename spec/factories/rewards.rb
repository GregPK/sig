# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :generic_reward, class: Reward do
    
    factory :ten_point_reward do
      name "Ten point reward"
      points(-10)
    end

    factory :qi do
      name "Watch an episode of QI"
      points(-6)
    end

    factory :comedy_animated_show do
      name "Watch an episode of FG/TS/AD/SP"
      points(-3)
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
