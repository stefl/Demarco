$(function() {
  $('.dropdown-toggle').dropdown();
  $(".thumbnail_image").each(function(i,e) {
    $(e).css({"background-image": "url(" + $(e).data().thumbnail + ")"});
    $(e).find("a").tipTip({ 
      content: $(e).find("details .title").html() 
    });
  });

  $("body").on('click','.ps-caption', function(){
    window.myPhotoSwipe.toolbar.toggleVisibility();
  });

  window.myPhotoSwipe = $("#images a.display").photoSwipe(
    {
      autoStartSlideshow: false, 
      enableMouseWheel: true , 
      enableKeyboard: true,
      captionAndToolbarFlipPosition: true,
      getImageCaption: function(el) {
        return $(el).find("details").text();
      }
    });
});