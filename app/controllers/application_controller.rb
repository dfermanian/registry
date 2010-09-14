

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => 'a7cabcdf1499df9ded55d8a3797d9387'
  ensure_authenticated_to_facebook


  ensure_application_is_installed_by_facebook_user

  filter_parameter_logging :fb_sig_friends
  
	helper_attr :current_user
  

  
  attr_accessor :current_user
  before_filter :set_current_user

  def set_current_user
    self.current_user = User.for(facebook_session.user.to_i,facebook_session)
  end
  

#  filter_parameter_logging :fb_sig_friends

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

end
