$(document).ready(function () {
  // search weather
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

  });


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

};
