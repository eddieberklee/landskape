$(function() {
  $("#black-background").hide();
  // document.ready() opening

  $(".pic-thumb").hover(
    function() {
      id = $(this).attr('id');
      $(this).stop(id, true, false);
      $(this).children(".pic-thumb-hover-content").animate({
        bottom: '0px',
        queue: id,
      },200);
    },
    function() {
      id = $(this).attr('id');
      $height = $(this).children(".pic-thumb-hover-content").css('height');
      $padding_top = $(this).children(".pic-thumb-hover-content").css('padding-top');
      $padding_bottom = $(this).children(".pic-thumb-hover-content").css('padding-bottom');
      $(this).stop(id, true, false);
      $(this).children(".pic-thumb-hover-content").animate({
        bottom: '-' + (parseInt($height) + parseInt($padding_top) + parseInt($padding_bottom)),
        queue: id,
      },200);
    });

  $(".pic-thumb-hover-content img").click(function() {
    $love_img = $(this);
    $love_img_src = $love_img.attr('src');

    if($love_img_src.indexOf('heart_unselected') >= 0) {
      $(this).attr('src', $love_img.attr('src').replace('heart_unselected','heart'));
    }
    else if ($love_img_src.indexOf('heart') >= 0) {
      $(this).attr('src', $love_img.attr('src').replace('heart','heart_unselected'));
    }
  });
  // document.ready() closing
  
  $("#popup .heart").click(function() {
    $love_img = $(this);
    $love_img_src = $love_img.attr('src');

    if($love_img_src.indexOf('heart_unselected') >= 0) {
      $(this).attr('src', $love_img.attr('src').replace('heart_unselected','heart'));
      $(this).siblings('span').text(parseInt($(this).siblings('span').text())+1);
    }
    else if ($love_img_src.indexOf('heart') >= 0) {
      $(this).attr('src', $love_img.attr('src').replace('heart','heart_unselected'));
      $(this).siblings('span').text(parseInt($(this).siblings('span').text())-1);
    }
  });

  $(".pic-thumb .pic").click(function() {
    $("#black-background").show();
  });
  $("#black-background-specific").click(function() {
    $("#black-background").hide();
  });

  $(".filters-item").click(function() {
    $("#viewing").text($(this).text());
  });

  $("#map-popup").click(function() {
    original_popup_left_img_src = $("#popup-left img").attr('src');
    original_popup_right_html = $("#popup-right").html();
    $("#popup-left img").attr('src','img/map.png');
    $("#popup-right").html('<div id="map-pin" style="cursor:pointer;"><img src="img/pin.png"/></div><div id="map-describe">Drag pin to update the landskape\'s location.</div><a class="btn btn-warning" id="update-location" style="width:130px;margin:0 auto;position:relative;top:100px;display:block;">Update Location</a>');
    $("#map-pin").draggable();
    $("#update-location").click(function() {
      $("#popup-left img").attr('src',original_popup_left_img_src);
      $("#popup-right").html(original_popup_right_html);
    });
  });
});
