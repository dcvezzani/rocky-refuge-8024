class PortalController < ActionController::Base
  layout "portal"
  before_filter :authenticate_user!#, except: [:index]

  def portal_basic
  end
end
