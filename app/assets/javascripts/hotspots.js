function stop_hotspot_adjustment( e, ui ) {
  var target_name = $(e.target).attr("id");
  var target_width = $(e.target).width();
  var target_height = $(e.target).height();
  console.log("#" + target_name + "{ position: absolute; left: " + ui.position.left + "px; top: " + ui.position.top + "px; width: " + target_width + "px; height: " + target_height + "px; }");
}

function register_hotspots(){

  /*
   * Configure image tags to include hotspot framework.  This can be used instead of manually including the framework.
   *
     image_tag "/assets/mock/triple-play.png",          image that hotspots will be mapped to
      class: "hotspot-enabled",                         mark image tag for adding hotspots
      "data-title" => "triple-play",                    class value to distinguish hotspot-zone from others (top-level)
      "data-path" => view_triple_play_directory_path,   anchor href value; when hotspot is clicked, go here
      "data-id" => "view-triple-play-directory",        id for div that surrounds anchor tag; this element is what is styled with border
      "data-mode" => "active",                          (new | active); when new, create opaque, solid yellow background color; when active, use a dashed border
      "data-dark-background" => "false"                 (true | false); when true, applies 'hotspot-dark' (currently blue); else, no class is applied (currently yellow)
   */

  $("img.hotspot-enabled").each(function(i, obj){
    var data_mode = $(obj).attr("data-mode");
    var data_title = $(obj).attr("data-title");
    var data_path = $(obj).attr("data-path");
    var data_id = $(obj).attr("data-id");
    var data_dark_background = ($(obj).attr("data-dark-background") == "true") ? "hotspot-dark" : "";

    var hotspot_zone = '<div class="hotspot-zone ' + data_title + '"><\div>';
    var hotspot_zone_selector = ".hotspot-zone." + data_title;
    $(hotspot_zone).insertAfter(obj);

    //var img_tag = $(obj).detach();
    $(obj).appendTo(hotspot_zone_selector);

    var hotspots = '<div class="hotspots">\n' +
    '  <div class="' + data_mode + '-hotspots"><!-- new,active -->\n' +
    '    <div id="' + data_id + '" class="' + data_dark_background + '"><a href="' + data_path + '">' + data_id + '</a></div>\n' +
    '  </div>\n' +
    '</div>\n';
    
    $(hotspots).appendTo(hotspot_zone_selector);
  });

  /*
   * Configure hotspots.  The ul>li* will be replaced with the hotspot framework.
   *
    <ul class="hotspot-enabled"                   mark image tag for adding hotspots 
      data-image="/assets/mock/triple-play.png"   url for image that the hotspot(s) is relatively located
      data-title="triple-play">                   class identifier for image and hotspot(s)

      <li data-id="view-triple-play-directory"    id for hotspot
        data-mode="active"                        (new | active); when new, create opaque, solid yellow background color; when active, use a dashed border
        data-dark-background="false">             (true | false); when true, applies 'hotspot-dark' (currently blue); else, no class is applied (currently yellow)

        <% view_triple_play_directory_path %>     anchor href value; when hotspot is clicked, go here
      </li>
    </ul>
   * 
   */

  $("ul.hotspot-enabled").each(function(i, obj){
    var data_image = $(obj).attr("data-image");
    if(typeof(data_image) == "undefined"){ data_image = $("img", obj).attr("src"); }
    console.log("data_image: " + data_image);

    var data_title = $(obj).attr("data-title");

    var hotspot_zone = '<div class="hotspot-zone ' + data_title + '"><\div>';
    var hotspot_zone_selector = ".hotspot-zone." + data_title;
    $(hotspot_zone).insertAfter(obj);

    var img = '<img src="' + data_image + '" />'
    $(img).appendTo(hotspot_zone_selector);

    var hotspots = '<div class="hotspots"></div>'
    var hotspots_selector = hotspot_zone_selector + " div.hotspots";
    $(hotspots).appendTo(hotspot_zone_selector);

    $("li", obj).each(function(j, li){
      var data_mode = $(li).attr("data-mode");
      var data_path = $(li).text();
      var data_id = $(li).attr("data-id");
      var data_dark_background = ($(li).attr("data-dark-background") == "true") ? "hotspot-dark" : "";

      var hotspot = '' +
      '  <div class="' + data_mode + '-hotspots"><!-- new,active -->\n' +
      '    <div id="' + data_id + '" class="' + data_dark_background + '"><a href="' + data_path + '">' + data_id + '</a></div>\n' +
      '  </div>\n';
      $(hotspot).appendTo(hotspots_selector);
    });

    $(obj).detach();
  });

    // <ul class="hotspot-enabled" data-image="/assets/mock/triple-play.png">
    //   <li data-title="triple-play" data-id="view-triple-play-directory" data-mode="active" data-dark-background="false"><%= view_triple_play_directory_path %></li>
    // </ul>
  

  $(".hotspots div div").addClass("hotspot");
  $(".new-hotspots div").draggable({ stop: stop_hotspot_adjustment }).resizable({ stop: stop_hotspot_adjustment });
  $(".new-hotspots div").each(function(i, el){
    var el_id = $(el).attr("class");
    var text = $(el).text();
    if(typeof(el_id) != "undefined" && (text.length < 1)){
      console.log(el_id);
      $(el).append("<a href='#'>" + el_id + "</a>");
    }
  });

  $(".active-hotspots div").click(function(e){
    var href = $(this).find("a").attr("href");
    console.log("href: " + href);
    location.href = href;
    return false;
  });
}

