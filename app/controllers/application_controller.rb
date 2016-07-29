class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	protect_from_forgery with: :exception

  def alert(type, message)
    flash[type] = message
  end

end