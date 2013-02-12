class PortalController < ActionController::Base
  layout "portal"
  #before_filter :authenticate_user!, except: [:index]

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
