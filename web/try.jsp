
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
 
String h=request.getParameter("busno"); 
                
se.setAttribute("Name",h);
   int z=Integer.parseInt(h);

  Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbase","root","root");
  PreparedStatement ps=con.prepareStatement("select *from busstops where busno=?");
  ps.setInt(1, z);
  ResultSet rs=ps.executeQuery();
  ResultSetMetaData rsmd = rs.getMetaData();

    int cn = rsmd.getColumnCount();
    cn-=1;
    List strList = new ArrayList();
if (rs.next()) {
    for(i=2;i<cn;i++)
    { if(!(rs.getString(i).equals("")))
    {
        strList.add(rs.getString(i));
}

}
}


 JSONArray jsonArray = new JSONArray(strList);
String s = jsonArray.toString();


ses.setAttribute("jsonArray",s); 
response.sendRedirect("22.jsp");
}
catch(Exception e)
{
  e.printStackTrace();
}
%>
      
        
        
        
        
        
        
        
    </body>
</html>
