class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_flash_error_for(object, title)
    flash[:error] = object.errors.full_messages
    flash[:title] = title
  end
end
