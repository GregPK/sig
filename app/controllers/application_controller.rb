class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def model_class()
    Kernel.const_get(self.class.to_s.gsub("Controller","").singularize)
  end
end
