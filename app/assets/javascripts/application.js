//= require webpack-bundle

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's 
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require turbolinks
// require_tree .
function initMap() {}
$(document).ready(function() {
  navigator.geolocation.getCurrentPosition(locationSuccess, locationFail);

  function locationSuccess(position) {
    latr.innerHTML = position.coords.latitude;
    longr.innerHTML = position.coords.longitude;
    $(document).ready(function initMap() {
      var uluru = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: uluru,
        mapTypeId: 'hybrid'
      });
      var marker = new google.maps.Marker({
        position: uluru,
        map: map
      });
      for (var i = 0; i <= 5; i++) {
        console.log(Number(document.getElementById("event" + i + "_latitude").innerHTML));
        console.log(Number(document.getElementById("event" + i + "_longitude").innerHTML));
        console.log(Number(document.getElementById("event" + i + "_radius").innerHTML));
        // Add the circle for this city to the map.
        var eventCircle = new google.maps.Circle({
          strokeColor: '#F26060 ',
          strokeOpacity: 0.7,
          strokeWeight: 1.5,
          fillColor: '#F337B4 ',
          fillOpacity: 0.15,
          map: map,
          center: {
            lat: Number(document.getElementById("event" + i + "_latitude").innerHTML),
            lng: Number(document.getElementById("event" + i + "_longitude").innerHTML)
          },
          radius: Number(document.getElementById("event" + i + "_radius").innerHTML) * 200
        });
      }
    });
  }

  function locationFail() {
    alert("Oops, could not find you. Check your browser settings and enable location services.  Or you won't get to swap... and swapping rules.");
  }
});
