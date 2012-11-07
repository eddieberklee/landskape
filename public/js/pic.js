$(function() {
  $(".black-background").hide();
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
  
  $(".popup .heart").click(function() {
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

  $(".filters-item").click(function() {
    $("#viewing").text($(this).text());
  });


  $(".pic-thumb .pic").click(function() {
    $("#photo-popup-view").show();
  });
	$(".comment-button").click(function() {
		$("#photo-popup-view").show();
	});
  $(".black-background-specific").click(function() {
    $(".black-background").hide();
  });

	$("#photo-popup-view a.btn-mini").click(function() {
		newtext = $(this).siblings("input[type='text']").val();
		$(".popup-comment-box").append('<div class="popup-comment"><span class="popup-comment-username"><a>amadeus</a>: </span><span class="popup-comment-text">'+newtext+'</span></div>');
	});

   $(".map-pin").draggable();

  $(".map-popup").click(function() {
		$("#map-popup-view").show();
    $("#update-location").click(function() {
			$("#map-popup-view").hide();
    });
  });
});
