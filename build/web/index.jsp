<%@page import="org.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>
   
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Medi-Caps Transport Tracker</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

  <link rel="stylesheet" type="text/css" href="css/main.css">
  
  
  
  <style>
     #map {
        height: 100%;
        z-index:19;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
       position: fixed;
    left: 40%;
    top: 10%;
    z-index: 1000;
    background-color: #fff;
    padding: 5px;
    border: 1px solid #999;
    text-align: center;
    font-family: 'Roboto','sans-serif';
    line-height: 30px;
    padding-left: 10px;      }
    </style>

  
  
  
  
  
  
  
  
  
</head>

<body>

<div class="search-menu">
<button class="menu-button" onclick="openNav()"></button>
</div>

<div id="mySidenav" class="sidenav" style="width:0px;">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
   <form action="try1.jsp">
 <button class="b1" type="submit" name="busno" value="1" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 1</button>
 <button class="b1" type="submit" name="busno" value="2" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 2</button>
 <button class="b1" type="submit" name="busno" value="3" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 3</button>
 <button class="b1" type="submit" name="busno" value="4" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 4</button>
 <button class="b1" type="submit" name="busno" value="5" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 5</button>
 <button class="b1" type="submit" name="busno" value="6" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 6</button>
 <button class="b1" type="submit" name="busno" value="7" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 7</button>
 <button class="b1" type="submit" name="busno" value="8" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 8</button>
 <button class="b1" type="submit" name="busno" value="9" onclick="redirect()"><i class="fa fa-bus"></i>   Bus 9</button>
 <button class="b1" type="submit" name="busno" value="10" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 10</button>
 <button class="b1" type="submit" name="busno" value="11" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 11</button>
 <button class="b1" type="submit" name="busno" value="12" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 12</button>
 <button class="b1" type="submit" name="busno" value="13" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 13</button>
 <button class="b1" type="submit" name="busno" value="14" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 14</button>
 <button class="b1" type="submit" name="busno" value="15" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 15</button>
 <button class="b1" type="submit" name="busno" value="16" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 16</button>
 <button class="b1" type="submit" name="busno" value="17" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 17</button>
 <button class="b1" type="submit" name="busno" value="18" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 18</button>
 <button class="b1" type="submit" name="busno" value="19" onclick="redirect()"><i class="fa fa-bus"></i>  Bus 19</button>
 <button class="b1" type="submit" name="busno" value="20" onclick="redirect()" style="margin-bottom: 5em;"><i class="fa fa-bus"></i>   Bus 20</button>
  </form>

</div>


<div id="mybuslist" class="buslist" style="overflow-y: scroll;">
<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 
<br>
<div id="busname" class="busstops"> <i      class="fa fa-bus"></i> Bus ${sessionScope.Name}</div> <a href="index1.jsp" class="closebusbtn">&larr;</a>
<ul id="myUL" style="list-style-type:none; padding: 0; margin: 0">
</ul>
<ul>
<li style="margin-bottom: 5em; margin-left: -2em;"><i class="fa fa-map-marker"></i>  Medicaps</li>
</ul>
</div>


<div class="search-button-container">
     <form action="search.jsp">
<button class="search-button" type="submit" name="stopname" id="search-button"></button>
     </form>
</div>

<div class="topnav">
<input type="text" id="myInput" onkeyup="myFunction()" onkeydown="hidefunction()" list="stoplist" placeholder="Search..">
</div>


<div id="tablewrapper">
<table id="myTable" style="display: none;">
           
</table>
</div>


  <div class="top-bar">
      <span class="io-bus-tracker" style="
    font-family:Source Sans Pro, Helvetica, sans-serif;
    font-size: 11pt;
    line-height: 2;
    letter-spacing: 0.2em;
    text-transform: uppercase;">Medi-Caps Transport Tracker</span>
    
    <span id="display-time" class="display-time" style="
    font-family: Source Sans Pro, Helvetica, sans-serif;
    font-size: 11pt;
    line-height: 2;
    letter-spacing: 0.2em;
    color: #ececec;
    text-transform: uppercase;">
        
    </span>
    
  </div>

<div id="floating-panel" style="display:none;">
    <b>Start: </b>
    <select id="start">
        <option value="${sessionScope.Source}, Indore">${sessionScope.Source}</option>
    </select>
    <select multiple id="waypoints">
   </select>
    <b>End: </b>
    <select id="end">
      <option value="Medi-Caps University">Medicaps</option>
      
    </select>
    </div>


  <div id="cards" class="cards"></div>
  <div id="map" class="map"></div>
  <div id="page-marker" class="page-marker">
    <svg>
      <g fill="none" fill-rule="evenodd" stroke="none" stroke-width="1">
        <circle id="page-marker-panel-0" cx="13" cy="13" r="12" stroke="#445A65" stroke-width="2" fill="none" />
        <circle id="page-marker-panel-1" cx="61" cy="13" r="12" stroke="#445A65" stroke-width="2" fill="none" />
        <circle id="page-marker-panel-2" cx="109" cy="13" r="12" stroke="#445A65" stroke-width="2" fill="none" />
      </g>
    </svg>
  </div>

  <script>
      
     var jsArray = ${jsonArray};
var ul=document.getElementById("myUL"); 
for (var i = 0; i <jsArray.length ; i++) {
var li=document.createElement("li");
li.innerHTML+='<i class="fa fa-map-marker"></i>'+" ";
li.appendChild(document.createTextNode(jsArray[i]));
ul.appendChild(li);
}
document.getElementById("mybuslist").style.width = "250px";
    
function closeStops()
{
         document.getElementById("mybuslist").style.width = "0 px";

        
}

var stops=${Stops};
    var lat=${Latitude};
    var lon=${Longitude};
 
var way= document.getElementById("waypoints");
for(var i=1;i<jsArray.length;i++)
{
    var option=document.createElement("option");
    option.value=jsArray[i]+", Indore";
    option.innerHTML=jsArray[i];
    way.appendChild(option);
}
 
 
   
    </script>
  
  
  <script defer src="js/index4.js"></script>
  <!-- Change out the following API_KEY for your Maps API Key -->
  <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9eIJROurElfZU3oGRKPD0OvUJ1o221kk&callback=initMap"></script>


</body>
</html>