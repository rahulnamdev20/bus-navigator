
<%@page import="java.util.Arrays"%>
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
int count=0;
  Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydbase","root","root");
  PreparedStatement ps=con.prepareStatement("select * from busstops where busno=?");
  ps.setInt(1,z);
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
   if((rs.getString(i).equals("")))
   {
       count++;
   }

}
}
if(count==18)
{
    response.sendRedirect("similarindex1.jsp");
}
out.println(count);
String a=(String)strList.get(0);
int k=strList.size();
String su[]=new String[k];
Float lat[]=new Float[k];
Float longit[]=new Float[k];

int j=0;
for(i=0;i<k;i++)
{ 
PreparedStatement pse=con.prepareStatement("select * from latlong where stops='"+(String)strList.get(i)+"';");

ResultSet rse=pse.executeQuery();
    if(rse.next())
    {
       
    su[j]=rse.getString("stops");
    lat[j]=rse.getFloat("lat");
     longit[j]=rse.getFloat("lon"); 
     j++;
    }
    
}


JSONArray jsonArray = new JSONArray(strList);
String s = jsonArray.toString();

JSONArray jsonArray1 = new JSONArray(su);
String m = jsonArray1.toString();
JSONArray jsonArray2 = new JSONArray(lat);
String n = jsonArray2.toString();
JSONArray jsonArray3 = new JSONArray(longit);
String o = jsonArray3.toString();


ses.setAttribute("jsonArray",s); 
ses.setAttribute("Source",a); 
ses.setAttribute("Stops",m); 

ses.setAttribute("Latitude",n); 
ses.setAttribute("Longitude",o); 
response.sendRedirect("index.jsp");

}
catch(Exception e)
{
  e.printStackTrace();
}
%>
      
        
        
        
        
        
        
        
    </body>
</html>
