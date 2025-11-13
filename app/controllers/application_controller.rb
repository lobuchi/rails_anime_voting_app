class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pagy::Backend

  private


  def require_login
    unless authenticated?
      # Customize this path to your login page if it's not root_path
      redirect_to root_path, alert: "You must be logged in to access this page."
    end
  end
end
