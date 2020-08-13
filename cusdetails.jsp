        
        
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
   ResultSet rs1=null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
   String j=request.getParameter("username");
   session.setAttribute("user2",j);
   String username=request.getParameter("username");
   PreparedStatement stmt= conn.prepareStatement("select * from v1 where username=?");
   PreparedStatement stmt1= conn.prepareStatement("select * from foodorder where username=?");
   stmt.setString(1,username);
   stmt1.setString(1,username);
   rs=stmt.executeQuery();
   rs1=stmt1.executeQuery();

%>



<html>
<head>
	<title>sss</title>
	<style>
#ul1
{
margin-left:0px;
margin-top:10px;

float: left;
}
ul li
{
list-style: none;
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


</style>
</head>
<body>
<ul id="ul1">
<li><a><a href="hm.html">HOME</a></a></li>
</ul>
<h1>CUSTOMER DETAILS</h1>
<br>
<br>
<jsp:useBean id="bean" class="BeanProg.cus">
<jsp:setProperty name="bean" property="cusname" value="<%= j %>"/>
</jsp:useBean>
<p>Welcome 
<jsp:getProperty name="bean" property="cusname"/>
</p>
 <center> <h2>ROOM DETAILS</h2><center>
   <table border="1" cellpadding="5" width="70%"   cellspacing="1"  align="center">
      <tr bgcolor="orange">   
        <th><b>first name</b></th>
        <th><b>last name</b></th>
        <th><b>phone</b></th>
        <th><b>email</b></th>
        <th><b>adhaar</b></th>
        <th><b>room number</b></th> 
        <th><b>No. of days</b></th> 
        <th><b>date of booking</b></th>
        <th><b>username</b></th> 
      </tr>
      <%
      while(rs.next())
      {
      %>
      <tr bgcolor="LightBlue">
        <td><%=rs.getString("fn")%></td>
        <td><%=rs.getString("ln")%></td>
        <td><%=rs.getString("phone")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("adhaar")%></td>
        <td><%=rs.getString("roomno")%></td>
        <td><%=rs.getString("no.ofdays")%></td>
        <td><%=rs.getString("dateofbooking")%></td>
        <td><%=rs.getString("username")%></td>
      </tr> 
      <%
      }
      rs.close();
      stmt.close();
      %>
    </table>
<ul >
<li><a><a href="roombooking.jsp">Book a room</a></a></li>
</ul>

<br>
<br>
<br>
<center><h2>FOOD DETAILS</h2><center>
 <table border="0" cellpadding="5" width="70%"   cellspacing="1"  align="center">
      <tr bgcolor="orange">
         <th><b>Food</b></th> 
        <th><b>Price</b></th> 
      </tr>
      <%
      while(rs1.next())
      {
      %>
      <tr bgcolor="LightBlue">
        <td><%=rs1.getString("food")%></td>
        <td><%=rs1.getString("cost")%></td>
      </tr> 
      <%
      }
      rs1.close();
      stmt1.close();
      conn.close();

      %>
    </table>
<ul >
<li><a><a href="foodorder.jsp">Place order</a></a></li>
</ul>

</body>
</html>

    

    

    