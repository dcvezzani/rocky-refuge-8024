class StickyNote < ActiveRecord::Base
  attr_accessible :action, :controller, :background_color, :height, :left, :top, :width, :z_index, :note, :collection_id, :referrer_url

  def self.for_referrer_url(referrer_url_value)
    @sticky_notes = StickyNote.where{referrer_url == my{referrer_url_value}}.select{[id, referrer_url, note, background_color]}.order{[referrer_url, updated_at]}
  end
end
