gk = FactoryGirl.create(:gk)

achiever_attr = { achiever: gk }
# rewards
r = []
r << FactoryGirl.create(:qi, achiever_attr)
r << FactoryGirl.create(:fifa, achiever_attr)
r << FactoryGirl.create(:scrolls, achiever_attr)
r << FactoryGirl.create(:comedy_animated_show, achiever_attr)
r << FactoryGirl.create(:ten_point_reward, achiever_attr)

#punishers
p1 = FactoryGirl.create(:unhealthy_food, achiever_attr)
p1 = FactoryGirl.create(:ten_point_punisher, achiever_attr)

# achievements
a1 = FactoryGirl.create(:asana_task_achievement, achiever_attr)
a2 = FactoryGirl.create(:exercise, achiever_attr)
a3 = FactoryGirl.create(:achievement, achiever_attr)


(0..15).each do |i|
  gk.use(a1) if i % 2 == 0
  gk.use(p1) if i % 3 == 0
  gk.use(r.sample) if i % 4 == 0
  gk.use(a2) if i % 5 == 0
end