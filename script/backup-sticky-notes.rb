raise "run this manually in script/console"

# run this in local rails console
File.open("./db/sticky-notes-2012-02-14.json", "w"){|f| f.write StickyNote.all.to_json }

# notes_data = JSON.parse(IO.read("./db/sticky-notes-2012-02-12.json")); notes_data.length
# notes_data = JSON.parse(IO.read("./db/sticky-notes-2012-02-13.json")); notes_data.length
notes_data = JSON.parse(IO.read("./db/sticky-notes-2012-02-14.json")); notes_data.length

# run this in remote (heroku) rails console
notes_data.each do |note_data|
  attrs = note_data.select{|k,v| !%w{id updated_at created_at controller action}.include?(k)}

  # just in case the entire url was passed in; we want relative url, please
  md = attrs["referrer_url"].match(/http:\/\/[^\/]+(.+)/)
  attrs["referrer_url"] = md[1] if md

  StickyNote.create!(attrs)
end; StickyNote.count


