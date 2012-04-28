$(function() {
  $('.dropdown-toggle').dropdown();

  window.myPhotoSwipe = $("#images a").photoSwipe(
    {
      autoStartSlideshow: true, 
      enableMouseWheel: true , 
      enableKeyboard: true,
      captionAndToolbarAutoHideDelay: -1,
      captionAndToolbarFlipPosition: true,
      getImageCaption: function(el) {
        return $(el).parent().find("details");
      }
    });
});