$(function() {
  $('.dropdown-toggle').dropdown();

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