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
     <link rel="stylesheet" href="assets1/css/main2.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300">
    <noscript><link rel="stylesheet" href="assets1/css/noscript.css" /></noscript>
  
</head>



<div class="search-menu">
<button class="menu-button" onclick="openNav()"></button>
</div>

<div id="mySidenav" class="sidenav" style="width: 250px;">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
   <form action="try.jsp">
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
  
    <script defer src="js/index.js"></script>
    
    
    <div style="
    margin-left: 85em;
    margin-top: 5em;">
      <form action="logout.jsp">
         <p> <input type="submit" value="Logout" style="z-index:10000"></p>
 
      </form>
  </div>
      
    
<div id="wrapper" style="margin-top: -7em;">

        <!-- Main -->
          <section id="main">
            <header>
            
              <h1 id="route" class="route">Enter  <i class="fa fa-bus"></i>  Bus ${sessionScope.Name} Stops </h1>
              <br>
              <form action ="bus.jsp">
<table>
<tr>
<td> Bus no </td>
<td><input type="text" id="no" name ="busno" value="${sessionScope.Name}" /></td>
</tr>
</table>
<br>
<p>
       Enter Origin: <input type="text" name="bus" style="max-width:10em;margin-top:-2em;margin-left:9em; "/>
    </p>
    
<div id="stopnames">
    
</div>


<a href="javascript:add_feed()"><i class="fa fa-plus-square" style="font-size:22px;color:#008cb2;"></i></a>

<p>
Enter Destination: <input type="text"  value="Medi-Caps" style="max-width:10em;margin-top:-2em;margin-left:12.5em;" >
</p><br>  
<p> <input type="submit" value="submit"></p>

</form>
  
            </header>
            
          </section>
  
        
      </div>
<div id="newlinktpl" style="display:none">
    <br>
    <p>
        <input type="text" name="bus" placeholder="Enter Stops" size="50" style="margin-top:-2em;"/>
    </p>
    
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
        if ('addEventListener' in window) {
          window.addEventListener('load', function() { document.body.className = document.body.className.replace(/\bis-loading\b/, ''); });
          document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
        }
  

 var jsArray = ${jsonArray};
var div=document.getElementById("stopnames");
for (var i = 0; i <jsArray.length ; i++) {
var p=document.createElement("p");
var checkbox = document.createElement('input');
var c = document.createElement('input');

checkbox.type = "checkbox";
checkbox.name = "bus";
checkbox.id="id";
checkbox.value = jsArray[i];
checkbox.innerHTML=jsArray[i];

c.type="hidden";
c.name="bus";
c.id="idHidden";


p.appendChild(checkbox);
p.appendChild(c);
p.innerHTML+=jsArray[i];
div.appendChild(p);


}

if(document.getElementById("id").checked) {
    document.getElementById('idHidden').disabled = true;
}


function add_feed()
{
	var div1 = document.createElement('div');
       
	// Get template data
	div1.innerHTML = document.getElementById('newlinktpl').innerHTML;
	// append to our form, so that template data
	//become part of form
	document.getElementById('stopnames').appendChild(div1);
   
}

</script>
   
     

    <script defer src="js/index.js"></script>
  <!-- Change out the following API_KEY for your Maps API Key -->
  <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9eIJROurElfZU3oGRKPD0OvUJ1o221kk&callback=initMap"></script>

    

</html>