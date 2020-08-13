<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
String sn=request.getParameter("ver");
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("select * from roombook where roomno='"+sn+"'"); 
if(rs.next())
{
out.println("<font color=red>");
out.println("room occupied");
out.println("</font>");
}

rs.close();
st.close();
con.close();
%>