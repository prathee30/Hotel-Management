        
        
        
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
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root");
  
   
   String j=(String)session.getAttribute("user2");
   PreparedStatement stmt= conn.prepareStatement("select * from register where username=?");
   stmt.setString(1,j);
   rs=stmt.executeQuery();
  

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
<li><a><a href="hm.html">BACK</a></a></li>
</ul>
<h1>FOOD ORDERING</h1>
<br>
<br>
<% out.println("order your food  "+j); %>
<br><br>
    <table border="1" cellpadding="5" width="70%"   cellspacing="1"  align="center">
      <tr bgcolor="orange"> 
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
     <center>
     <br><br><br>
  <table border="0">
	<tr><th>Product</th>
		<th>&nbsp</th>
		<th> Details</th>
			</tr>
		<tr>
		<td><img src="idli.jpg" width="150px" height="150px"></td>
       	<td>&nbsp</td>
		<td font-style="em">Idli(2 pcs) <br>price:20/-Rs </td>
		<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
		<td><button id="b04"><a href="javascript:cart('idli',20)">Add to cart</button></a></td>

	</tr>
	<tr>
		<td><img src="vada.jpg" width="150px" height="150px"></td>
		<td>&nbsp</td>
		<td font-style="em">Vada(2pcs) <br>price:16/-Rs </td>
		<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
		<td><button id="b05"><a href="javascript:cart('vada',16)">Add to cart</button></a></td>

	</tr>
	<tr>
		<td><img src="dosa.jpg" width="150px" height="150px"></td>
		<td>&nbsp</td>
		<td font-style="em">Plain  Dosa<br>price:35/-Rs </td>
		<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
		<td><button id="b06"><a href="javascript:cart('dosa',35)">Add to cart</button></a></td>

	</tr>
	<tr>
		<td><img src="poori.jpg" width="150px" height="150px"></td>
		<td>&nbsp</td>
		<td font-style="em">Poori <br>price:35/-Rs </td>
		<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
		<td><button id="b07"><a href="javascript:cart('poori',35)">Add to cart</button></a></td>

	</tr>
	<tr>
		<td><img src="pongal.jpg" width="150px" height="150px"></td>
		<td>&nbsp</td>
		<td font-style="em">Pongal<br>price:40/-Rs </td>
		<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
		<td><button id="b04"><a href="javascript:cart('pongal',40)">Add to cart</button></a></td>


	</tr>

</table></center>
<form type="hidden" action="foodordering.jsp" name="orderform" id="orderfrm" method="POST">
<input type="text" value="" name="order" style="display: none">
<input type="text" value="" name="ordercost" style="display: none">
</form>
<script type="text/javascript">
function cart(detail,price){
var str1 = "Confirm to Add the item '"+detail+"'' of "+"Rs. "+price+" into the cart ? ";
var h = confirm(/*"Confirm to Add the item '+detail+'' of "+"Rs. +price+ into the cart ? "*/str1);
if(h == true){
document.orderform.order.value=detail;
document.orderform.ordercost.value=price;
document.getElementById("orderfrm").submit();
}
}
</script>
<br>
<br>
<form name="fm" method="post" action="totalcost.jsp" align="center">
<input type="submit" value="done"></form>


</div>
</body>
</html>

    

    

    