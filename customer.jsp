<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.Statement" %>
<%  
   Connection conn = null;
   ResultSet rs=null;
   Statement stmt=null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
   out.write("Connected to mysql!!!");
   stmt=conn.createStatement();
   rs=stmt.executeQuery("select fn,ln,adhaar,phone,email from register");
%>

<!DOCTYPE html>
<html>
<head>
	<title>sss</title>
	<style>
ul
{
margin-left:0px;
margin-top:10px;
list-style: none;
}
ul li
{
float: left;
width: 168px;
height: 40px;
background-color:#E89E00;

line-height: 40px;
text-align: center;
font-size: 20px;
margin-right:2px;
border-radius: 20px;
border: 4px solid gray;
}
ul li a
{
text-decoration:none;
color:#000000;
display:block;
}

ul li a:hover
{
background-color:#0EA101  ;
border-radius: 20px;
}

h1
{
color: black;
font-weight:bold;
font-size:50px;
text-align:center;
background-color:#E89E00;
}
table, th, td {
  border: 3px double;
  border-collapse: collapse;
}
th, td {
  padding: 5px;
  text-align: center;
}

</style>
</head>
<body>
<ul>
<li><a><a href="hm.html">BACK</a></a></li>
</ul>
<h1>VIEW CUSTOMERS</h1>
<br>
<br>
    <table border="1" cellpadding="5" width="70%"   cellspacing="1" >
      <tr bgcolor="GreenYellow">  
        <th><b>First Name</b></th>
        <th><b>Last Name</b></th>
        <th><b>Adhaar Details</b></th> 
        <th><b>Phone No.</b></th> 
        <th><b>Email</b></th> 
      </tr>
      <%
      while(rs.next())
      {
      %>
      <tr bgcolor="LightBlue">
        <td><%=rs.getString("fn")%></td>
        <td><%=rs.getString("ln")%></td>
        <td><%=rs.getString("adhaar")%></td>
        <td><%=rs.getString("phone")%></td>
        <td><%=rs.getString("email")%></td>
      </tr> 
      <%
      }
      rs.close();
      stmt.close();
      conn.close();
      %>
    </table>
  </center>
</div>
</body>
</html>

    