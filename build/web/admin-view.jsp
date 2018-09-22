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

   <%
//get UserName to verify 
String email=(String)session.getAttribute("email");
if(email!=null)
{

}
else
{

response.sendRedirect("admin.html");

}


%>







<!DOCTYPE html>
<html>

<head>
   <meta charset="utf-8">
        <title>Medi-Caps Transport Tracker</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" type="text/css" href="css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link rel="stylesheet" href="assets1/css/main1.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300">
    <noscript><link rel="stylesheet" href="assets1/css/noscript.css" /></noscript>
</head>

<body class="is-loading">

<div class="search-menu">
<button class="menu-button" onclick="openNav()"></button>
</div>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px color:#ecebeb"></i>   Bus 1</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 2</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 3</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 4</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 5</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 6</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 7</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 8</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 9</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 10</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 11</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 12</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 13</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 14</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 15</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 16</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 17</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 18</button>
  <button class="b1" onclick="openStops()"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 19</button>
  <button class="b1" onclick="openStops()" style="margin-bottom: 5em;"><i class="fa fa-bus" style="font-size:20px"></i>   Bus 20</button>
  
</div>



<div class="search-button-container">
<button class="search-button"></button>
</div>

<div class="topnav">
<input type="text" id="myInput" onkeyup="myFunction()" onkeydown="hidefunction()" list="stoplist" placeholder="Search..">
</div>


<div id="tablewrapper">
<table id="myTable" style="display: none;">
           
</table>
</div>


  <div class="top-bar">
    <span class="io-bus-tracker">Medi-Caps Transport Tracker</span>
    <span id="display-time" class="display-time">
   </span>
  </div>

  <div id="cards" class="cards"></div>
  <div id="map" class="map"></div>
  <
    <script defer src="js/index.js"></script>
<div id="wrapper">

        <!-- Main -->
          <section id="main" style="bottom: 6em;">
            <header>
            
              <h1>Welcome Admin</h1>
              <br><br>  
              <h1>Set up the Bus Routes</h1>
              <br><br> 
              <button class="log" onclick="location.href='22.jsp';"><i class="fa fa-bus" style="font-size:20px"></i> Set</button>
               <br><br>  

            </header>
            
          </section>

        
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

    <script defer src="js/index.js"></script>
  <!-- Change out the following API_KEY for your Maps API Key -->
  <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9eIJROurElfZU3oGRKPD0OvUJ1o221kk&callback=initMap"></script>

      <script>
        if ('addEventListener' in window) {
          window.addEventListener('load', function() { document.body.className = document.body.className.replace(/\bis-loading\b/, ''); });
          document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
        }
      </script>


</body>
</html>