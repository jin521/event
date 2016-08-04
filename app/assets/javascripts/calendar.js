$( document ).ready(function() {
  $('.event').hide(); // to hide the content not to show in any box

  $('.day').on('click', function(){
    var $occasion = $(this).html();
    $('.show-events').html($occasion); // to add to the div. if we use append is gonna add all events any time we click in any box
    $('.show-events').find('.event').show();// we need to show what is in event because we hide before
    $('.show-events').find('.day-date').remove(); // to remov the number of the day and not show it
    $('.occasion-heading').hide(); // hiding H1 in show.html.erb when you look for events in calendar
  });
});
