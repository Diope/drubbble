$(document).ready(ready);
$(document).on('page:load', ready);

function clearFlashes(){
  $(".flashes").animate({opacity:'0'}, 1500);
}

var ready = function() {
   setTimeout(clearFlashes, 1000);  //Flash fade
 };
