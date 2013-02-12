class AddReferrerUrlToStickyNotes < ActiveRecord::Migration
  def change
    add_column :sticky_notes, :referrer_url, :string
  end
end
