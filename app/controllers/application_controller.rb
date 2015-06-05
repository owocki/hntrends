class ApplicationController < ActionController::Base
	include ActionController::Caching::Pages
	self.page_cache_directory = "#{Rails.root.to_s}/public/page_cache"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
