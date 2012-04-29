$(function() {
  $('.dropdown-toggle').dropdown();

  $(".thumbnail_image").each(function(i,e) {
    $(e).css({"background-image": "url(" + $(e).data().thumbnail + ")"});
  });

  $("body").on('click','.ps-caption', function(){
    window.myPhotoSwipe.toolbar.toggleVisibility();
  });

  window.myPhotoSwipe = $("#images a").photoSwipe(
    {
      autoStartSlideshow: false, 
      enableMouseWheel: true , 
      enableKeyboard: true,
      captionAndToolbarFlipPosition: true,
      getImageCaption: function(el) {
        console.log($(el).parent());
        return $(el).find("details").text();
      }
    });
});