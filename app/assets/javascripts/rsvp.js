$(document).ready(function () {

 $('#rsvp_create').on('click', function (e) {

  var rsvpURL = $(e.target).attr('url');
  //.target is the button itself, we are grabing the url attribute is set in the button helper on  show.html.erb

   $.ajax(rsvpURL).done(function (response) {
    //  console.log("HERE", response, response.status);
     if (response.action === 'rsvp') {
       $('#rsvp_create').removeClass('glyphicon-heart-empty').addClass("glyphicon-heart");

     }else if (response.action === 'unrsvp'){
       $('#rsvp_create').removeClass('glyphicon-heart').addClass("glyphicon-heart-empty");

     }
  });
});

    $("#rsvp_create").hover(function() {
          $(this).css('cursor','pointer').attr('title', 'Save or remove this event');
      }, function() {
       $(this).css('cursor','auto');
   });



});
