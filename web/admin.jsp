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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%! int x,m,t,q,o,c,i,r,a,b ; %>
<%
 String a=request.getParameter("email");
 String b=request.getParameter("pass");
try
{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbase","root","root");
            //select * from userlog where email='a' and password='b';
            PreparedStatement pmt=con.prepareStatement("select * from userlog where email='"+a+"' and password='"+b+"';");
            ResultSet rs=pmt.executeQuery();
            if(rs.next())
            {  
                
                String c=rs.getString("email");
                HttpSession login =request.getSession(true);
                
                login.setAttribute("email",c);
                response.sendRedirect("admin-view.jsp");
            }
            else
            {
              response.sendRedirect("error.html");
    
            }
            
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
</body>
</html>