module UsableByAchiever
  extend ActiveSupport::Concern

  def use(id)
    usable = get_usable(id)
    usable.achiever.use(usable)
  end

  def get_usable(id)
    usable = self.model_class.find(id)
    usable
  end



end
