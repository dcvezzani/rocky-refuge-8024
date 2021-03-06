class MockPortalController < ActionController::Base
  layout "mock_portal"
  #before_filter :authenticate_user!, except: [:index]

  def mock_portal_basic
  end
  
  def sticky_note
    notes = StickyNote.where{controller == my{params[:controller]} and action == my{params[:action]}}
  end

  def update_sticky_note
    render :json => { 
      background_color: params[:background_color], 
      height:           params[:height], 
      id:               params[:id], 
      left:             params[:left], 
      note:             params[:note], 
      top:              params[:top], 
      width:            params[:width], 
      z_index:          params[:z_index]
    }
  end
end
