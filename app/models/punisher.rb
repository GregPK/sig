# == Schema Information
#
# Table name: punishers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  points      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  achiever_id :integer
#
# Indexes
#
#  index_punishers_on_achiever_id  (achiever_id)
#

class Punisher < ActiveRecord::Base
  belongs_to :achiever#, inverse_of: :achievements
end
