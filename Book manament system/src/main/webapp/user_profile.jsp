<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Book.myorder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="sty.css"  type="text/css"/>
<style>
.div {
    padding: 42px;
    /* margin: 33px; */
    background: antiquewhite;
    position: relative;
    top: 94px;
    /* margin-top: 13px; */
    border: 2px solid;
    width: 27%;
    left: 36%;
    /* top: -25%; */
    top: 163px;
    border-radius: 11px;
}


label {
    background: #ff4343;
    font-size: 19px;
    padding: 13px;
    /* border: 2px solid; */
    position: relative;
    top: -65px;
    right: -49px;
    border-radius: 26px;
    color: white;
    font-size: 20px;
}
input#input-file {
    display: none;
}
h3 {
    font-size: 31px;
    margin-top: 58px;
    margin-bottom: 9px 
}
h4 {
    font-size: 24px;
}
img {
    background: black;
    border: 2px solid;
     border-radius: 269px;
    height: 154px;
}
label:hover {
    background: #fc9393;
}
body {
    background: #6a685d;
}
</style>
</head>
<body>
<header>
<nav>
<div class="nav-bar">
<a href="Book.jsp" id="a">Home</a>
<a href="user_profile.jsp" id="a">Profile</a>
<a href="myorderjsp.jsp" id="a">Order list</a>
<a href="logout" id="l">Logout</a>
</div>
</nav>

</header>
<%String email=(String)session.getAttribute("key_email"); 
myorder  my=new myorder ();
Connection con=my.connection1();
String name="";
String querry="select Name from user where Email_id=?";
PreparedStatement ps=con.prepareStatement(querry);
ps.setString(1,email);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	 name=rs.getString("Name");
}

%>
<div class="div">
<div class="img">
<form action ="" method="get">
<img src="imgs/bggreen.png" id="profile-pic">
<label for="input-file" name="i" >upload image</label>
<input type="file"   accept="image/jpeg,image/png,image/jpg"  id="input-file">

</form>
</div>
<script type="text/javascript">
let profilepic= document.getElementById("profile-pic");
var inputFile= document.getElementById("input-file");

inputFile.onchange = function()
{
	profilepic.src=URL.createObjectURL(inputFile.files[0]);
	console.log(profilepic.src);
	}
</script>
<h3>Hello ! <%=name%></h3>
<h4>Your Email Id Is : <%=email %></h4>
</div>

</body>
</html>