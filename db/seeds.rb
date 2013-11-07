# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

gk = FactoryGirl.create(:gk)

achiever_attr = { achiever: gk }
# rewards
r1 = FactoryGirl.create(:qi, achiever_attr)
FactoryGirl.create(:fifa, achiever_attr)
FactoryGirl.create(:scrolls, achiever_attr)

#punishers
p1 = FactoryGirl.create(:unhealthy_food, achiever_attr)

# achievements
a1 = FactoryGirl.create(:asana_task_achievement, achiever_attr)
a2 = FactoryGirl.create(:exercise, achiever_attr)



15.times do |i|
  gk.use(a1) if i % 2 == 0
  gk.use(p1) if i % 3 == 0
  gk.use(r1) if i % 4 == 0
  gk.use(a2) if i % 5 == 0
end