class PortalController < ApplicationController
  layout "portal"
  #before_filter :authenticate_user!, except: [:index]
end
