
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
{int i=0;
HttpSession ses = request.getSession(true);
 
 
 Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbase","root","root");
  PreparedStatement ps=con.prepareStatement("select * from busstops");
 ResultSet rs=ps.executeQuery();
int count = 0;
      while (rs.next()) {
        count++;
      }  
 List<List<String>> outer = new ArrayList<>();
 
for(i=1;i<=count;i++)
 {
 
PreparedStatement pse=con.prepareStatement("select * from busstops where busno=?");
 pse.setInt(1,i);
 ResultSet rse=pse.executeQuery();
 List strList = new ArrayList();

  ResultSetMetaData rsmd = rse.getMetaData();
  int cn = rsmd.getColumnCount();
  cn-=1;
   
if (rse.next()) {
    for(int j=2;j<=cn;j++)
    { if(!(rse.getString(j).equals("")))
      {
        strList.add(rse.getString(j));
        
      }
    }
}
outer.add(strList);
}
 
 
 
 
 JSONArray jsonArray1 = new JSONArray(outer);
String s = jsonArray1.toString();

ses.setAttribute("jsonArray1",s); 
out.println(s);

}
catch(Exception e)
{
  e.printStackTrace();
}
%>
      
        
        
        
        
        
        
        
    </body>
</html>
