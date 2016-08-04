$(document).ready(function () {


  // search weather
  $('#generate').on('click', function (e) {

    e.preventDefault(); // Don't submit this form for me, I'll do with AJAX
    var $city = $('#weatherfinder').val();
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

var getWeatherAt = function(days_from_now, lat, long){
  if(days_from_now < 0 ){
    days_from_now = 0;
  }
  var url = 'http://api.openweathermap.org/data/2.5/forecast/daily?&lat=' + lat + '&lon=' + long + '&cnt=16&units=metric&mode=JSON&APPID=bf5017448e9d946e404e311eeb7504bf';
  $.ajax(url).done(function (response){
      // debugger;

        var event_day_weather = response.list[days_from_now];
        console.log(event_day_weather, days_from_now);
        console.log('here');
        console.log(event_day_weather.temp.max);
        console.log(event_day_weather.temp.min);
        console.log(event_day_weather.weather[0]['description']);
        console.log(event_day_weather.weather[0]['icon']);
        console.log(event_day_weather.weather[0]['main']);
//http://openweathermap.org/img/w/10d.png
        $('#mainW').append(event_day_weather.weather[0]['main']);
        var icon = event_day_weather.weather[0]['icon'];
        var weatherIcon = 'http://openweathermap.org/img/w/' + icon + '.png';
        $('#weatherImg').attr('src',weatherIcon);
        $('#maxTempW').append(event_day_weather.temp.max.toFixed(0));
        $('#minTempW').append(event_day_weather.temp.min.toFixed(0));
        $('#descriptionW').append(event_day_weather.weather[0]['description']);









        // $('#weatherS').append(event_day_weather);
        // $('#temp').append(response.main["temp"]);
        // $('#humidity').append(response.main["humidity"]);
        // $('#windspeed').append(response.wind["speed"]);
  });

};
