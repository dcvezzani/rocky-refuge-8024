class AddCollectionIdToStickyNotes < ActiveRecord::Migration
  def change
    add_column :sticky_notes, :collection_id, :string
  end
end
