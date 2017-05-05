//= require jquery
//= require turbolinks
//= require materialize-sprockets
//= require rails-ujs
//= require tether
//= require materialize/extras/nouislider
//= require webpack-bundle
// require_tree .


function locationSuccess(position) {
  var uluru = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: uluru,
    mapTypeId: 'hybrid'
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
  for (var i = 0; i <= 5; i++) {
    var eventCircle = new google.maps.Circle({
      strokeColor: 'teal',
      strokeOpacity: 1,
      strokeWeight: 1.5,
      fillColor: '#F337B4 ',
      fillOpacity: 0.35,
      map: map,
      center: {
        lat: Number(document.getElementById("event" + i + "_latitude").innerHTML),
        lng: Number(document.getElementById("event" + i + "_longitude").innerHTML)
      },
      radius: Number(document.getElementById("event" + i + "_radius").innerHTML) * 200
    });
  }
}

function locationFail() {
  alert("Oops, could not find you. Check your browser settings and enable location services.  Or you won't get to swap... and swapping rules.");
}
