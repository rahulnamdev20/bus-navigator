
const mapStyle = [
  {
    elementType: 'geometry',
    stylers: [
      {
        color: '#eceff1'
      }
    ]
  },
  {
    elementType: 'labels',
    stylers: [
      {
        visibility: 'off'
      }
    ]
  },
  {
    featureType: 'administrative',
    elementType: 'labels',
    stylers: [
      {
        visibility: 'on'
      }
    ]
  },
  {
    featureType: 'road',
    elementType: 'geometry',
    stylers: [
      {
        color: '#cfd8dc'
      }
    ]
  },
  {
    featureType: 'road',
    elementType: 'geometry.stroke',
    stylers: [
      {
        visibility: 'off'
      }
    ]
  },
  {
    featureType: 'road.local',
    stylers: [
      {
        visibility: 'off'
      }
    ]
  },
  {
    featureType: 'water',
    stylers: [
      {
        color: '#b0bec5'
      }
    ]
  }
];

function initMap()
{      var locations=[];
  for (var i = 0; i < stops.length; i++) {
    
        locations.push([parseFloat(lat[i]),parseFloat(lon[i])] ); 
    }
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
      var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: new google.maps.LatLng(lat[2], lon[2]),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: mapStyle
    });
  directionsDisplay.setMap(map);
  
  
   var infowindow = new google.maps.InfoWindow();

   
  
 
       var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        };

        document.addEventListener('DOMContentLoaded', onChangeHandler);
        document.addEventListener('DOMContentLoaded', onChangeHandler);
     
 }
 
 function calculateAndDisplayRoute(directionsService, directionsDisplay) {
          var waypts = [];
        var checkboxArray = document.getElementById('waypoints');
        for (var i = 0; i < checkboxArray.length; i++) {
            waypts.push({
              location: checkboxArray[i].value,
              stopover: true
            });
          }
        
   
        directionsService.route({     
          origin: document.getElementById('start').value,
          destination: document.getElementById('end').value,
          waypoints: waypts,
          optimizeWaypoints: true,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }



      
      
var nameArray = ["Sikchhak Nagar",
"Tirupati Nagar",
"Ramchand Nagar",
"Jaroliya",
"Navneet Garden",
"Sai Mandir",
"Reti Mandi Square",
"Gangwal Bus Stand",
"MOJ Line",
"Mhow Naka",
"Mahesh Dudh Deri",
"Dravid Nagar", 
"Ranjeet Hanuman",
"Charu Medical",
"Mahavir Gate",
"Airport", 
"Airport Thana",
"Vidya Dham",
"Kalani Nagar",
"Medi-Caps"
 ];
var x = document.getElementById("myTable");
    
for (var i = 0; i < nameArray.length; i++) {
var row = document.createElement("tr");
row=x.insertRow(0);
var td=row.insertCell(0);
td.innerHTML=nameArray[i];
}


function hidefunction(){
        document.getElementById("myTable").style.display="none";
}


    function myFunction() {
  var input, filter, table, tr, td, i;
    
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        
        tr[i].style.display = "";
       if(input.value!="")document.getElementById("myTable").style.display="block";  
          //alert(lngt);
      } else {
        tr[i].style.display = "none";
     // document.getElementById("myTable").style.display="none";
      }
    }       
  }
  
 
}

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
     
    document.getElementById("map").style.opacity="0.5";
    hidefunction();
    }

 




function openStops() {
    document.getElementById("mybuslist").style.width = "250px";
    document.getElementById("busname").innerHTML = event.srcElement.innerHTML;

}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("mybuslist").style.width = "0";
    document.getElementById('map').style.opacity="1";
    myFunction();
 }
function closeStops() {
  document.getElementById("mybuslist").style.width = "0";
} 

     time = new Date();
    function getOrdinalNum(n) {
  return n + (n > 0 ? ['th', 'st', 'nd', 'rd'][(n > 3 && n < 21) || n % 10 > 3 ? 0 : n % 10] : '');
}
i=time.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true }) + ", " + time.toLocaleString("en-us",{ month: "long" })+ " " +getOrdinalNum(time.getDate());

document.getElementById("display-time").innerHTML = i;


var box = document.querySelector("#myInput");

document.addEventListener("click", function(event) {

// If user clicks inside the element, do nothing
if (event.target.closest("#myInput")) return;

// If user clicks outside the element, hide it!
    else hidefunction();
});

(function(){
    'use-strict';

var td = document.getElementsByTagName('td');
    for(var i=0;i<td.length;i++) {
        td[i].addEventListener('click', change, false);
    }
    
    function change() {
     
        var input=document.getElementById("myInput");
        input.value=event.srcElement.innerHTML;  
        document.getElementById("search-button").value=input.value;
}
}());



