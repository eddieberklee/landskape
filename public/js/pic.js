$(function() {
  // document.ready() opening

  $(".pic-thumb").hover(
    function() {
      $(this).children(".pic-thumb-hover-content").animate({
        bottom: '+=40px',
      },200);
    },
    function() {
      $(this).children(".pic-thumb-hover-content").animate({
        bottom: '-=40px',
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
