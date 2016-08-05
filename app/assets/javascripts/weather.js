// search weather
// it needs to load before document ready that is the reason it is outside
var getWeatherAt = function(days_from_now, lat, long){
  if(days_from_now < 0 ){
    days_from_now = 0;
  }

  var url = 'http://api.openweathermap.org/data/2.5/forecast/daily?&lat=' + lat + '&lon=' + long + '&cnt=16&units=metric&mode=JSON&APPID=bf5017448e9d946e404e311eeb7504bf';
  $.ajax(url).done(function (response){
      // debugger;

        var event_day_weather = response.list[days_from_now];
//         console.log(event_day_weather, days_from_now);
//         console.log('here');
//         console.log(event_day_weather.temp.max);
//         console.log(event_day_weather.temp.min);
//         console.log(event_day_weather.weather[0]['description']);
//         console.log(event_day_weather.weather[0]['icon']);
//         console.log(event_day_weather.weather[0]['main']);
// //http://openweathermap.org/img/w/10d.png
        $('#mainW').append(event_day_weather.weather[0]['main']);
        var icon = event_day_weather.weather[0]['icon'];
        var weatherIcon = 'http://openweathermap.org/img/w/' + icon + '.png';
        $('#weatherImg').attr('src',weatherIcon);
        $('#maxTempW').append(event_day_weather.temp.max.toFixed(0));
        $('#minTempW').append(event_day_weather.temp.min.toFixed(0));
        $('#descriptionW').append(event_day_weather.weather[0]['description']);

  });
};
