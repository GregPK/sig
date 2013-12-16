# == Schema Information
#
# Table name: achievements
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  points      :integer
#  repeatable  :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  achiever_id :integer
#
# Indexes
#
#  index_achievements_on_achiever_id  (achiever_id)
#

class Achievement < ActiveRecord::Base
  belongs_to :achiever#, inverse_of: :achievements

end
