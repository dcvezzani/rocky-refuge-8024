raise "run this code through rails console (and make sure you know what the code is doing first)"

move_to = StickyNote.where{collection_id == my{"portal/order_your_free_retirement_checkup".gsub(/\//, ",")}}
move_from = StickyNote.where{collection_id == my{"portal/free_retirement_checkup".gsub(/\//, ",")}}

# update sticky note references from one collection_id to another
StickyNote.update_all("collection_id = 'portal,order_your_free_retirement_checkup'", "collection_id = 'portal,free_retirement_checkup'")

