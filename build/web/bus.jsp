
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*" %>

<%@page import="java.io.*" %>

<%@page import="javax.sql.*" %>
   
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 try
    {
    int x,m,t,q,o,c,i,r ;
    r=0;
String s5[]=request.getParameterValues("bus");
q=s5.length;
String s=request.getParameter("busno");
int z=Integer.parseInt(s);

String p;

    Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbase","root","root");
       
       for(i=1;i<=q;i++)
       { 
	PreparedStatement ps=con.prepareStatement("update busstops set stop"+i+"='"+s5[r]+"' where busno="+z+";");
       ps.executeUpdate();
        r++;
       
       }
       for(i=q+1;i<=20;i++)
       {
       PreparedStatement ps=con.prepareStatement("update busstops set stop"+i+"='"+""+"' where busno="+z+";");
       ps.executeUpdate();
        r++;
       
       }
	 
response.sendRedirect("22.jsp");	
         
}
 
catch(Exception e)
{
	e.printStackTrace();
}

%>
</body>
</html>