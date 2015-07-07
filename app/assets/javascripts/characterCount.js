function updateCountdown() {
  // 140 characters max
  var left = 140 - jQuery('.post_text_area').val().length;
  if(left == 1) {
    var charactersLeft = ' character left.'
  }
  else if(left < 0){
    var charactersLeft = ' characters too many.'
  }
  else{
    var charactersLeft = ' characters left.'
  }
  jQuery('.countdown').text(Math.abs(left) + charactersLeft);
}

jQuery(document).ready(function($) {
  updateCountdown();
  $('.post_text_area').change(updateCountdown);
  $('.post_text_area').keyup(updateCountdown);
});
