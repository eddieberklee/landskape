$(function() {
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
      $(this).stop(id, true, false);
      $(this).children(".pic-thumb-hover-content").animate({
        bottom: '-' + $height,
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
});
