$(document).ready(function(){
  setTimeout(function(){
    $('.flashes').fadeOut("slow", function(){
      $(this).remove();
    })
  }, 2500);
});
