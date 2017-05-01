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

$(document).ready(function() {
  $(function() {
    navigator.geolocation.getCurrentPosition(locationSuccess, locationFail);

    function locationSuccess(position) {
      latr.innerHTML = position.coords.latitude;
      longr.innerHTML = position.coords.longitude;

      $(function initMap() {
        var uluru = { lat: position.coords.latitude, lng: position.coords.longitude };
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: uluru,
          mapTypeId: 'hybrid'
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
        $.getJSON( "events.json", function( data ) {
          // var event = [];
          var eventMap = []
          for (let i = 0; i < data.events.length; i++) {
              eventMap.push( data.events[i] );
          }
            console.log(eventMap)
          for (var event in eventMap) {
            // Add the circle for this city to the map.
            var eventCircle = new google.maps.Circle({
              strokeColor: '#FF0000',
              strokeOpacity: 0.8,
              strokeWeight: 2,
              fillColor: '#FF0000',
              fillOpacity: 0.35,
              map: map,
              center: {lat: event.latitude, lng: event.longitude},
              radius: event.radius
            });
          }
        });
      });
    }

    function locationFail() {
      alert("Oops, could not find you. Check your browser settings and enable location services.  Or you won't get to swap... and swapping rules.");
    }
  });
});
