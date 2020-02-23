let map
let geocoder

function initMap(){
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 35.6594666, lng: 139.7005536},
    zoom: 16,
  });

  marker = new google.maps.Marker({
    position:  {lat: 35.6594666, lng: 139.7005536},
    map: map
  });
}

function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      let lat = results[0].geometry.location.lat();
      let lng = results[0].geometry.location.lng();
      let ido = document.getElementById('ido')
      ido.innerHTML = lat;
      let keido = document.getElementById('keido')
      keido.innerHTML = lng;
      let mark = {
          lat: lat, 
          lng: lng
      };
      map.setCenter(results[0].geometry.location);
      let marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('該当する結果がありませんでした');
    }
  });   
}
