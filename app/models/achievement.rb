class Achievement < ActiveRecord::Base
  belongs_to :achiever#, inverse_of: :achievements
end
