$( document ).ready(function() {
  $('.event').hide(); // to hide the content not to show in any box
  
  $('.day').on('click', function(){
    var $occasion = $(this).html();
    $('.show-calendar').html($occasion); // to add to the div. if we use append is gonna add all events any time we click in any box
    $('.show-calendar').find('.event').show();// we need to show what is in event because we hide before
  });
});
