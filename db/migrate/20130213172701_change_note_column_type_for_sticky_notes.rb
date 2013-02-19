class ChangeNoteColumnTypeForStickyNotes < ActiveRecord::Migration
  def up
      change_column :sticky_notes, :note, :text
  end
  def down
      # This might cause trouble if you have strings longer
      # than 255 characters.
      # change_column :sticky_notes, :note, :string
      raise "can't change column type; it might cause trouble if you have strings longer than 255 characters in the note column"
  end
end
