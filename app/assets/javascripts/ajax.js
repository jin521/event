$(document).ready(function () {


  // search weather
  $('#generate').on('click', function (e) {

    e.preventDefault(); // Don't submit this form for me, I'll do with AJAX
    var $city = $('#weatherfinder').val()
    var URL = 'http://api.openweathermap.org/data/2.5/weather?q=' + $city + '&units=metric' + '&mode=JSON'+'&APPID=bf5017448e9d946e404e311eeb7504bf'; //using  API 'openweathermap'
    $.ajax(URL).done(function (response) { // onreadystatechange with readystate === 4

      $('#weather').append(response.weather[0]["description"]);
      $('#temp').append(response.main["temp"]);
      $('#humidity').append(response.main["humidity"]);
      $('#windspeed').append(response.wind["speed"]);
   });
 });


 $('#rsvp_create').on('click', function (e) {

  var rsvpURL = $(e.target).attr('url');
  console.log(rsvpURL);
   $.ajax(rsvpURL).done(function (response) {
        console.log("HERE", response);
        //  debugger;
      }).fail(function(){
         console.log('failed');
  });
});



});
