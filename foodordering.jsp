<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.Statement" %>
<% 
String order = request.getParameter("order");
String ordercost = request.getParameter("ordercost");
String uname=(String) session.getAttribute("user2");
session.setAttribute("user2",uname);
try{
   Connection conn = null;
   ResultSet rs=null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
   
   Statement st=conn.createStatement();
   int i=st.executeUpdate("insert into foodorder values('"+order+"','"+ordercost+"','"+uname+"')");
   
}
catch(Exception e){
out.print(e);
}
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


</style>
</head>
<body>
<ul>
<li><a><a href="hm.html">HOME</a></a></li>
</ul>
<h1>FOOD ORDERING CART</h1>
<br>
<br>
<form action="foodorder.jsp" name="cart1" method="post">
<input type= "submit" value="add item"></form>
<form action="totalcost.jsp" name="cart" method="post">
<input type= "submit" value="done"></form>
</body>
</html>

    