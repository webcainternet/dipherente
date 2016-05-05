<div class="box_html <?php echo $heading_title; ?>">
	<?php echo $html; ?>
</div>

<script>
	window.onload = function() {  
	
	var mapelement=document.getElementById('map');
	
	if(mapelement){
	
	function initialize() {	

	var locations = [
		  ['Clothing', 42.332, -83.046, 2],
		  ['Clothing', 42.649224, -73.796384, 1]
	];
	var styles = [
	 {
        "featureType": "administrative",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "lightness": 33
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2e5d4"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#c5dac6"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "lightness": 20
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#c5c6c6"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#e4d7c6"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#fbfaf7"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#acbcc9"
            }
        ]
    }
	];

	var styledMap = new google.maps.StyledMapType(styles,{name: "Styled Map"});
	var map;
	var marker, i;
		
	var mapOptions = {
		zoom: 13,
		scrollwheel: false,
		center: new google.maps.LatLng(42.649224, -73.796384),
		mapTypeControl: false,
		panControl: true,
		scaleControl: false,
		streetViewControl: true,
		mapTypeControlOptions: {
		  mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
		}
	};
	  google.maps.event.addDomListener(window, "resize", function() {
		var center = map.getCenter();
		google.maps.event.trigger(map, "resize");
		map.setCenter(center);
	});
		map = new google.maps.Map(document.getElementById('map'),mapOptions);
		map.mapTypes.set('map_style', styledMap);
		map.setMapTypeId('map_style');

		for (i = 0; i < locations.length; i++) {  
		  marker = new google.maps.Marker({
			   map: map,
			   
			   position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			   animation: null
		  });
		}
		google.maps.event.addListener(marker, 'mouseout', function() {
		  marker.setIcon(markerImage);
		});
		
		
		google.maps.event.addListener(marker, 'click', function () {
			toggleBounce();
			infowindow.open(map, marker);
			setTimeout(toggleBounce, 1500);
		});
	}

	  function toggleBounce () {
			if (marker.getAnimation() != null) {
				marker.setAnimation(null);
			} else {
				marker.setAnimation(google.maps.Animation.BOUNCE);
			}
		}
		
	initialize();
	} };
</script>