# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

gk = FactoryGirl.create(:gk)

achiever_attr = { achiever: gk }
# rewards
FactoryGirl.create(:qi, achiever_attr)
FactoryGirl.create(:fifa, achiever_attr)
FactoryGirl.create(:scrolls, achiever_attr)

# achievements
a1 = FactoryGirl.create(:asana_task_achievement, achiever_attr)
a2 = FactoryGirl.create(:exercise, achiever_attr)

Random.rand(1..10).times do |i|
  gk.has_achieved(a1)
end

Random.rand(1..4).times do |i|
  gk.has_achieved(a2)
end

