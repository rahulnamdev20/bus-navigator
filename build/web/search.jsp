
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
<%@page import="javax.servlet.http.*" %>

<%@page import="javax.sql.*" %>
   
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

 <% 
try
{int i;
HttpSession ses = request.getSession(true);
HttpSession se = request.getSession(true);
 
String h=request.getParameter("stopname"); 
                
if(h=="")
{
    response.sendRedirect("similarindex.html");
}
Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbase","root","root");
  PreparedStatement ps=con.prepareStatement("select busno from busstops WHERE CONCAT(stop1, '', stop2, '', stop3, '', stop4, '', stop5, '', stop6, '', stop7, '', stop7, '', stop8, '', stop9, '', stop10, '', stop11, '', stop12, '', stop13, '', stop14, '', stop15, '', stop16, '', stop17, '', stop18, '', stop19, '', stop20) LIKE'%"+h+"%' ;");
  ResultSet rs=ps.executeQuery();
    
  if(rs.next()){ 
    int j=rs.getInt("busno"); 
    ses.setAttribute("busno",j);
    response.sendRedirect("result.jsp");

  }
  

}
catch(Exception e)
{
  e.printStackTrace();
}
%>
      
     
        
        
        
        
        
        
    </body>
</html>
