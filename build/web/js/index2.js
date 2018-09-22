

/* eslint-disable no-unused-vars, no-shadow-global */
/* globals google */

/* global firebase, google */

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

function initMap() {
  var locations = [
      ['mhow naka', 22.71643022, 75.87639128, 1],
        ['Ranjit hanuman', 22.72400219, 75.88871068, 2],
        ['footi koti', 22.69739502, 75.86972755, 3],
        ['Medi-Caps', 22.61978621, 75.80504484, 4],
        ['Greater vaishali', 22.75316137, 75.89420115, 5],
        ['Bhavarkua', 22.757062, 75.882186, 6],
        ['Greater Vaishali', 22.683682, 75.829533,7],
        ['Rajmoholla', 22.715683, 75.840675,8] ,
        ['Agrasen Nagar', 22.726800, 75.838039,9],  
       ['Jangeer Wala' ,22.726452, 75.881059,10], 
       ['Bhandari Mull Chowk', 22.734057, 75.875027,11 ] ,
       ['Polo Ground' ,22.734509, 75.857538,12 ], 
       ['Mari Mata', 22.733942, 75.849812,13 ], 
       ['VIP Road Shiv Mandir',  22.728041, 75.846163,14], 
       ['Golden Gate' , 22.756324, 75.892589,15],  
      ['Bombay Hospital' ,22.753649, 75.903826,16] , 
      ['Mahalaxmi Nagar', 22.761734, 75.906012,17],  
       ['Nariman Point Square ', 22.770301, 75.908805,18 ], 
       ['piphaliyana',  22.705778, 75.905708 ,19], 
       ['Musakhedi', 22.689953, 75.888458 ,20], 
       ['Ashram Bapu Square',  22.685381, 75.873571 ,21], 
       ['QC' , 22.669139, 75.881768 ,22], 
       ['Tejaji Nagar',  22.638901, 75.888353,22],   
['chitawad',  22.692327, 75.882110,23 ], 
['SBI bank ', 22.694773, 75.880432,24],  
['Navlakha',  22.698509, 75.877974,25],  
['Takshashila', 22.693968, 75.870192 ,26], 
['MY',  22.711237, 75.882843 ,27], 
['GPO', 22.707432, 75.878844  ,28],
['Industry House',  22.727537, 75.887780 ,29], 
['Malviya PP',  22.748946, 75.903560 ,30], 
['Khajarana', 22.731651, 75.902462 ,31], 
['Mayur Hospital ', 22.724154, 75.905774,32],  
['Kalandi', 22.685132, 75.922016 ,33], 
['Silver Spring', 22.659649, 75.911530,34],  
['Kanadia Road ', 22.720732, 75.901105,35 ], 
['teenimli' ,22.689561, 75.884259,36]

 
 


        
       ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: new google.maps.LatLng(22.7196, 75.8577),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: mapStyle
    });

    var infowindow = new google.maps.InfoWindow();

   
  var config = {
    apiKey: "AIzaSyC0DFcPZG-Qv5sxwnq-KqT0g-hgBVyp98Q",
    authDomain: "medi-caps-transoprt-manager.firebaseapp.com",
    databaseURL: "https://medi-caps-transoprt-manager.firebaseio.com",
    projectId: "medi-caps-transoprt-manager",
    storageBucket: "medi-caps-transoprt-manager.appspot.com",
    messagingSenderId: "1033937149062"
  };
  firebase.initializeApp(config);

database=firebase.database();
var ref=database.ref('raw-locations/1');

ref.on('value',gotData);

 
function gotData(data)
{
    var locations=data.val();
   var keys=Object.keys(locations);
   
var lat=[];
var lng=[];
   for(var i=0;i<keys.length;i++)
   {
var k=keys[i];
lat[i]=parseFloat(locations[k].lat);
lng[i]=parseFloat(locations[k].lng);
console.log(lat[i],lng[i]);

}
new google.maps.Marker({
  map: map,
  position: new google.maps.LatLng(lat[0],lng[0]),
  icon:'images/icon.png',
  fillColor: '#00CCBB',
    fillOpacity: 1,
    strokeColor: '',
    strokeWeight: 0
  

});

}

 

    var marker, i;

    for (i = 0; i < locations.length; i++) { 
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }

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
"Airport Road", 
"Airport Thana",
"Vidya Dham",
"Kalani Nagar"
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














