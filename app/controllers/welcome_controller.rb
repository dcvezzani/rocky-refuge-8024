class WelcomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
  end

  def wizard
  end

  def portal_basic
    render layout: "portal"
  end
end
