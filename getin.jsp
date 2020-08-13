        
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.Statement" %>
<%  
   Connection conn = null;
   
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
   out.write("Connected to mysql!!!");
String fname=request.getParameter("fname");
  String lname=request.getParameter("lname");
String adhar=request.getParameter("adhar");
String phno=request.getParameter("phno");
String mail=request.getParameter("mail");
String psw=request.getParameter("psw");
String cpsw=request.getParameter("cpsw");
String username=request.getParameter("username");
    PreparedStatement stmt= conn.prepareStatement("insert into register values(?,?,?,?,?,?,?,?)");
   
   stmt.setString(1,fname);
   stmt.setString(2,lname);
   stmt.setString(3,adhar);
   stmt.setString(4,phno);
   stmt.setString(5,mail);
   stmt.setString(6,psw);
   stmt.setString(7,cpsw);
   stmt.setString(8,username);
   stmt.executeUpdate();
   out.println("Data is successfully inserted!");
   String uname=request.getParameter("username");
   String psw1 = request.getParameter("password");
  

PreparedStatement stmt1 = conn.prepareStatement("select username,pw from register where username = ? and pw = ?");
stmt1.setString(1,uname);
stmt1.setString(2,psw1);
ResultSet rs = stmt1.executeQuery();  

String j = request.getParameter("uname");
session.setAttribute("user",j);
%>

<html>
<head>
<title>
login
</title>
<style>
body
{
margin:0;
padding:0;
background:url(pool.jpg);
background-size:cover;
background-position:center;
background-family:sans-serif;
}
ul
{
margin:0px;
padding: 10px;
list-style: none;
}
ul li
{
float: left;
width: 168px;
height: 40px;
background-color:#E89E00;
opacity:;
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
ul li ul li
{
display:none;
font-size: 15px;
}
ul li:hover ul li
{
display:block;
}

.loginbox
{
width:380px;
height:500px;
background:#000;
border-radius: 40px;
color:#fff;
top:50%;
left:50%;
position:absolute;
transform:translate(-50%,-50%);
}

.log
{
width:110px;
height:110px;
border-radius:50%;
position:absolute;
top: -50px;
left: calc(50% - 50px);
}

h1
{
margin: 0;
padding: 60px;
text-align: center;
font-size: 22px;
}

.loginbox p
{
margin-left:10px;
padding: 0;
font-weight: bold;
}

.loginbox input
{
width: 90%;
margin-bottom: 20px;
}

.loginbox input[type="text"], input[type="password"]
{
border: none;
border-bottom: 1px solid #fff;
background: transparent;
margin-left:10px;
outline: none;
height: 40px;
color: #fff;
font-size: 16px;
}

.loginbox input[type="submit"]
{
border: none;
outline: none;
height: 40px;
margin-left:15px;
background: #E89E00 ;
color: #fff;
font-size: 18px;
border-radius: 20px;
}

.loginbox input[type="submit"]:hover
{
cursor: pointer;
background: #65F63D;
color:#000;
}

.loginbox a
{
text-decoration: none;
font-size: 15px;
line-height: 20px;
color: #ffc107;
margin-left:30px;
}

.loginbox a:hover
{
color:#65F63D;
}
</style>
<script type="text/javascript">
		function loadXMLDoc()
		{
			var xmlhttp;
			var k=document.getElementById("uname").value;
			var urls="checkusername.jsp?ver="+k;
			if (window.XMLHttpRequest)
			{
				xmlhttp=new XMLHttpRequest();
			}
			else
			{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4)
				{
					document.getElementById("err").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		function loadXMLVal()
		{
			var xmlhttp;
			var l=document.getElementById("pass").value;
			var urls="checkpassword.jsp+pass="+l;
			if (window.XMLHttpRequest)
			{
				xmlhttp=new XMLHttpRequest();
			}
			else
			{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4)
				{
					document.getElementById("pswd").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		} 
	  	$(document).ready(function() {
	  		$("#MyModal").modal();
	  	});
	</script>
</head>
<body>
<ul>
<li><a><a href="home1.html">HOME</a></a></li>
</ul>
<div class="loginbox">
<img src="log.png" class="log">
<h1>GUEST LOGIN</h1>
<form name="login" action="cusdetails.jsp" method="POST">
<p>USERNAME / ID</p>
<input type="text" id="username" value="" name="username" placeholder="enter your username">
<p>PASSWORD</p>
<input type="password" name="password" placeholder="enter your password" id="password">
<input type="submit" name="" value="LOGIN"></form>


<br>
<a href="new.html">register</a></div>
</body>
</html>
    

    