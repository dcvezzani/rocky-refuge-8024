module StickyNotesHelper
  def sticky_notes(current_controller, current_action)
    current_controller ||= params[:controller]
    current_action ||= params[:action] #@virtual_path

    notes_collection = StickyNote.where{collection_id == my{"#{current_controller},#{current_action}"}}

    content = <<-EOL
    <div id="sticky_notes" data-collection-id="#{current_controller},#{current_action}" data-url='#{sticky_notes_path}' data-prefix='sticky_note'>
      #{sticky_notes_collection(notes_collection)}
	  </div>
EOL
    raw([sticky_notes_css, content, sticky_notes_js].join("\n"))
  end

  def sticky_notes_collection(notes_collection)
    out = []
    notes_collection.each do |note|
    out << <<-EOL
      <div id="#{note.id}" class="stickyNote">
        <div class='note'>#{note.note}</div>
        <div class='color'>#{note.background_color}</div>
        <div class='z_index'>#{note.z_index}</div>
        <div class='left'>#{note.left}</div>
        <div class='top'>#{note.top}</div>
        <div class='width'>#{note.width}</div>
        <div class='height'>#{note.height}</div>
      </div>
EOL
    end
    out.join("\n")
  end

  def sticky_notes_js
    content = <<-EOL
<script type="text/javascript">
  $(document).ready(function(){
    var sticky_notes_url = $("#sticky_notes").attr("data-url"); 
    var sticky_notes_prefix = $("#sticky_notes").attr("data-prefix"); 
    var sticky_notes_collection_id = $("#sticky_notes").attr("data-collection-id"); 

    $("#sticky_notes").addStickyNotes({
      url: sticky_notes_url, 
      prefix: sticky_notes_prefix, 
      collection_id: sticky_notes_collection_id, 
      left: 37, 
      top: 126
    });
  });
</script>
EOL
    raw(content)
  end

  def sticky_notes_css
    content = <<-EOL
    <style type="text/css">
      ul.sticky-note-actions{
        margin: 0; 
        padding: 0; 
      }
      ul.sticky-note-actions li{
        list-style: none; 
        border-left: 0;
        padding-right: .5em;
        display: inline-block; 
      }
      ul.sticky-note-actions li + li{
        list-style: none; 
        border-left: 2px solid black;
        padding: 0 .5em;
      }

      .stickyNote div.paragraph-break{
        padding-top: .75em;
      }
      .stickyNote ol, 
      .stickyNote ul{
        padding: 0; 
        margin: 0;
        margin-left: 1em;
      }
    </style>
EOL
    raw(content)
  end
  
end
