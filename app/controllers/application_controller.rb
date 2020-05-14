class ApplicationController < ActionController::Base
  include Spree::AuthenticationHelpers

  def admin_only
    unless current_spree_user && current_spree_user.admin?
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Sorry, you must be an administrator to access that page."
    end
  end
end
