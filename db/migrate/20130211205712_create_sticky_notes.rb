class CreateStickyNotes < ActiveRecord::Migration
  def change
    create_table :sticky_notes do |t|
      t.string :controller
      t.string :action
      t.string :background_color
      t.integer :height
      t.integer :left
      t.integer :top
      t.integer :width
      t.integer :z_index

      t.timestamps
    end
  end
end
