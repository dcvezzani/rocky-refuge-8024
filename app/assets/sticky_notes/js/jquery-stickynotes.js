// varsion 1.0.2
(function($) {
  /**
   * Returns a random integer between min and max
   * Using Math.round() will give you a non-uniform distribution!
   * http://stackoverflow.com/questions/1527803/generating-random-numbers-in-javascript-in-a-specific-range
   */
  function getRandomInt(min, max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

	$.fn.addStickyNotes = function(options) {
		var defaults = { 
			colors: ['#FDFB8C', '#FF99CC', '#99FFCC', "#99CCFF"],
			url:"#",
			type:"POST",
			width: '150',
			height: '150',
			left: '0',
			top:'0',
			prefix: null,
			collection_id: null,
			save:['note', 'width', 'height', 'top', 'left', 'z-index', 'background-color', 'id']
		};
		var settings = $.extend(false, defaults, options);
		$(this).each(function() {
      var sticky = new StickyNote(this, settings);
    });
	}
	function StickyNote(wrapper, options) {
		console.log(options)
    this.init(wrapper, options);
  };
  StickyNote.prototype = {
		wrapper: false,
		id: 0,
		z_index:0,
		colors: ['#FDFB8C', '#FF99CC', '#99FFCC', "#99CCFF"],
		color_index: getRandomInt(0,3),
		url: "#",
		method_type: "POST",
		width: '150',
		height: '150',
		left: '0',
		top:'0',
    prefix: null,
	  collection_id: null,
		save:['note', 'width', 'height', 'top', 'left', 'z-index', 'background-color', 'id'],
		init: function(wrapper, options){
			this.wrapper = $(wrapper);
			context = this;
			$.each(options, function(k, v){
				//console.log(k.toString())
				switch(k.toString()){
					case 'type':
						context.method_type = v;
            break; 
					case 'colors':
						context.colors = v;
            break; 
					case 'color_index':
						context.color_index = v.length-1;
            break; 
					case 'prefix':
						context.prefix = v || null;
            break; 
					case 'collection_id':
						context.collection_id = v || null;
            break; 
					case 'url':
						context.url = v || "#";
            break; 
					case 'height':
						context.height = v;
            break; 
					case 'width':
						context.width = v;
            break; 
					case 'top' :
						context.top = v;
            break; 
					case 'left':
						context.left = v;
            break; 
					case 'save' :
						context.save = v;
            break; 
				}
			})
			this.initializeExistingStickyNotes();
			this.initializeZIndexAndID();
			this.initializeStickyNote();
		},
		initializeExistingStickyNotes : function(){
			var context = this;
			$('.stickyNote').each(function(){
				var sticky = $(this);

				//this.id=(sticky.children('id').text()||++context.id);
				content = '<div class="textnote">'+sticky.children('.note').html()+'</div>';
				color = (sticky.children('.color')[0] ? sticky.children('.color').text() : context.colors[context.color_index = ((++context.color_index)%(context.colors.length))])
				sticky.
          css('background-color', color).
          css('width', (sticky.children('.width').text()||context.width)+'px').
          css('height', (sticky.children('.height').text()||context.height)+'px').
          css('z-index', (sticky.children('.z_index').text()||++context.z_index)).
          css('top', (sticky.children('.top').text()||context.top)+'px').
          css('left', (sticky.children('.left').text()||context.left)+'px').
          html(content).draggable({start : function(){sticky.css('z-index', ++context.z_index);},stop : function(){context.callback(sticky);}}).resizable({stop : function(){context.callback(sticky);}});

        context.initializeStickyNoteDelete(sticky);
        context.initializeStickyNoteChangeColor(sticky);
				context.inPlaceEdit(sticky);
			})
		},
		initializeZIndexAndID : function(){
			var context = this;
			$('.stickyNote').each(function(){
				if( context.z_index < $(this).css('z-index')){context.z_index = $(this).css('z-index');}
				if( context.id < parseInt(this.id)){context.id = parseInt(this.id);}
			})
		},
		stickyNoteStyles : function(sticky){
			this.color_index = ((++this.color_index)%(this.colors.length));
			var color=this.colors[this.color_index];
			sticky.css('background-color', color).css('height', this.height).css('width', this.width).css('left', this.left).css('top', this.top).css('z-index', this.z_index).children('form').children('textarea').css('background-color', color);
		},
		changeColorStickyNote : function(e){
      var div = e.target.parentNode;
			this.color_index = ((++this.color_index)%(this.colors.length));
			var color=this.colors[this.color_index];
      $(div).css('background-color', color); 
      $(div).find('textarea').css('background-color', color);
      this.callback(e.target.parentNode);
		},
		removeStickyNote : function(e){
      var div = e.target.parentNode;
      var note_id = $(div).attr("id");

      if(note_id != 'newStickyNote'){

        if(!confirm("Are you sure?")){ return false; }

        var ajax_url = this.url;
        var data = "";

        if(note_id){
          data += "id=" + note_id;
          data += "&_method=delete";
          ajax_url = this.url + "/" + note_id;
        }

        return $.ajax({
          type:     this.method_type,
          url:      ajax_url,
          data:     data,
          error:    function(data){div.remove();alert('Unable to remove.')},
          success:  function(response){
            $(div).remove();
          }, 
          dataType: "json"
        });

      } else {
        $(div).remove();
      }

		},
		initializeStickyNoteDelete : function(div){
      var self = this;
      var link = $("<a href='javascript: xvoid();' class='delete'>x</a>");
      div.prepend(link);
      link.click(function(e){ 
        self.removeStickyNote(e);
        return false;
      })
		},
		initializeStickyNoteChangeColor : function(div){
      var self = this;
      var link = $("<a href='javascript: xvoid();' class='change-color'>c</a>");
      div.prepend(link);
      link.click(function(e){ 
        self.changeColorStickyNote(e);
        return false;
      })
		},
		initializeStickyNote : function(){
      var self = this;
			link = "<a href='javascript: xvoid(); ' class='addANoteLink'>Add a Note</a>";
			showNotes = "<a href='javascript: xvoid(); ' class='showNotesLink'>Show notes</a>";
			hideNotes = "<a href='javascript: xvoid(); ' class='hideNotesLink'>Hide notes</a>";

			this.wrapper.append("<ul class='sticky-note-actions'></ul>");

      $("ul.sticky-note-actions", this.wrapper).append("<li>" + link + "</li>");
      $("ul.sticky-note-actions", this.wrapper).append("<li>" + hideNotes + "</li>");
      $("ul.sticky-note-actions", this.wrapper).append("<li>" + showNotes + "</li>");

			var context = this;
			$(".addANoteLink").click(function(){
        $(".stickyNote").show();

				div = $("<div class='stickyNote' id='newStickyNote'></div>");
				var form=context.createForm();
				div.append(form);

        self.initializeStickyNoteDelete(div);
        self.initializeStickyNoteChangeColor(div);

				context.wrapper.append(div);
				context.stickyNoteStyles(div)
				context.saveNoteOnBlur();
				div.draggable({start : function(){div.css('z-index', ++context.z_index);},stop : function(){context.callback(div);}}).resizable({stop : function(){context.callback(div);}});
        $("textarea", div).focus();
			});

			$(".hideNotesLink").click(function(){
        $(".stickyNote").hide();
			});

			$(".showNotesLink").click(function(){
        $(".stickyNote").show();
			});
		},
		createForm : function(){
			form = $("<form></form>");
			textarea = $("<textarea name='note' class='note'></textarea>");
			form.append(textarea);
			return form;
		},
		saveNoteOnBlur : function(){
			var context = this;
			$('.note').blur(function(){
				sticky = $(this).parents('.stickyNote');
        var sticky_value = this.value.replace(/\n\n+/g, "\n<div class='paragraph-break'></div>\n");
				sticky.append('<div class="textnote">'+ sticky_value +'</div>');
				//sticky[0].id=""+context.id+"";
				$(this).parents('form').remove();
				context.callback(sticky);
				context.inPlaceEdit(sticky);
			});
		},
		inPlaceEdit : function(sticky){
			var context = this;
			sticky.click(function(){
				div = $(this);
				var form=context.createForm();
				form.children('textarea').val(div.children('.textnote').html()).css('background-color', div.css('background-color'));
				div.append(form).children('.textnote').remove();
				context.saveNoteOnBlur();
				div.unbind('click')
			});
		},
		callback : function(div){
			if(this.url.length>1){
        var self = this;
				var data = ""
        var prefixed_field_name = ((self.prefix) ? self.prefix + "[collection_id]" : "collection_id");
				data += (prefixed_field_name + "=" + self.collection_id);

        prefixed_field_name = ((self.prefix) ? self.prefix + "[referrer_url]" : "referrer_url");
				data += "&" + (prefixed_field_name + "=" + location.href.match(/http:\/\/[^\/]+(.+)$/)[1]);

        var note_id = null;

				$.each(this.save, function(){
					if(data.length>0){data += "&"};
          prefixed_field_name = ((self.prefix) ? self.prefix + "[" + this + "]" : this);
					data += (prefixed_field_name.replace(/-/g, "_") + "=");

					switch(this.toString()){
						case 'note':
              var note_value = div.children('.textnote').html();
							data += escape(note_value);
              break;
						case 'id':
              if(div[0].id != 'newStickyNote'){
                data += div[0].id;
                note_id = div[0].id;
              }
              break;
						default :
              console.log("attr: " + this.toString());
              var value = div.css(this.toString());
              var pixel_measurement = value.match(/(\-?\d+)px$/);
              if(pixel_measurement){
  							data+=pixel_measurement[1];
              } else {
  							data+=value;
              }
					}
				})

        var ajax_url = this.url;
        if(note_id){
          data += "&_method=put"
          ajax_url = this.url + "/" + note_id;
        }
				return $.ajax({
          type:     this.method_type,
          url:      ajax_url,
          data:     data,
          error:    function(data){div.remove();alert('Unable to save.')},
          success:  function(response){
            if(response){
              div[0].id=response.id
            }
          }, 
          dataType: "json"
        });
			}
		}
	}
})(jQuery)
