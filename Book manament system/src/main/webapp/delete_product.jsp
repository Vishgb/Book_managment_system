<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Book.myorder"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
h3 {
    display: inline-flex;
    justify-content: space-between;
    padding-left: 70px;
    font-size: 27px;
    margin-right: 141px;
}
img {
    height: 130px;
}
h5 {
    font-size: 26px;
    position: relative;
    right: 109px;
    padding-left: 37px
}
form {
    display: flex;
    /* padding: 4px; */
    justify-content: space-around;
   
    margin:0px;
    margin-bottom:-31px;
}
.div {
    border: 2px solid;
    background: gainsboro;
}
div {
    border: 2px solid;
    background: antiquewhite;
}
img#im {
    position: relative;
    right: 95px;
}
h5#title {
    position: relative;
    left: -104px;
}
h5#price {
    position: relative;
    left: -110px;
}
button#button {
    position: relative;
    top: -55px;
    padding: 9px;
    font-size: 18px;
    background: green;
    color: whitesmoke;
    border: 8px solid;
    border-radius: 6px;
    height:64px;
    left:445px;
}
button#button1 {
    padding: 6px;
    position: relative;
    top: 49px;
    font-size: 22px;
    margin-left: 47px;
    background: red;
    color: white;
    border-radius: 4px;
    height:55px;
}
p#ip {
    display: flex;
    justify-content: center;
    font-size: 21px;
    color: green;
}
a {
    color: #043cb5;
    font-size: 21px;
}
</style>
</head>
<body>

<div class ="div">
<h3>Id </h3>   <h3>Image</h3>       <h3>Title</h3>  <h3>Price</h3>
</div>
<div>
<%

myorder  my=new myorder ();
Connection con=my.connection1();
String querry="select * from product";
PreparedStatement psmt=con.prepareStatement(querry);
ResultSet rs=psmt.executeQuery();
int i=0;
while(rs.next())
{
	int id=rs.getInt("Img_id");
	String img= rs.getString("Img_n");
	String title=rs.getString("Title");
	String price=rs.getString("Price");
	%>
	<div id="form">
	<form action="delete" method="get">
	<h5><%= id %> </h5> <img src="imgs/<%= img %>"  id="im"> <h5 id="title"><%= title %></h5>  <h5 id="price"><%= price %></h5>
	<button type="submit" id="button1" name="submit1" value= <%=id %>>delete</button>
	</form>
	<form action="update_product.jsp" method="get">
	<button type="submit" id="button" name="submit" value= <%=id %>>Update</button>
	
	</form>
	</div>
	<% 
	i++;
}
%>

</div>
<a href="Admine_home.jsp"><p>Redirect home page ?</p></a>
</body>
</html>