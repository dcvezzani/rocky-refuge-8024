class AddNoteToStickyNotes < ActiveRecord::Migration
  def change
    add_column :sticky_notes, :note, :string
  end
end
