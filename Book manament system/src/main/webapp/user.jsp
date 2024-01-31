<%@page import="Book.user_status"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Book.myorder"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.p {
    display: flex;
    justify-content: space-around;
    font-size: 26px;
}
.p {
    border: 2px solid;
    background: rgb(69 226 43);
}
.tb {
    border: 2px solid;
    background: #ffea7638;
}
form {
    display: flex;
    justify-content: space-around;
    font-size: 23px;
   
    /* color: chartreuse; */
    position: relative;
    left: 42px ;
}
input {
    display: none;
}
button {
    padding: 5px;
    /* margin: 3px; */
    margin-top: 7px;
    margin-bottom: 18px;
    border: 2px solid;
    border-radius: 7px;
     background: red;
    color: cyan;
    border-color: gainsboro;
    padding-left: 25px;
    padding-right: 31px 
}
button:hover {
   
    background: green;
}

p#oid {
    margin-right: 50px;
}
div#body {
    border: 2px solid;
}
p#pm {
    font-size: 25px;
    color: blue;
}
</style>

</head>


<body>
<div id="body">

<div class="p"><p>Order Id</p><p>Book Id</p><p>Email Id</p><p>Date</p><p>Status</p></div><br>
<%
myorder  my=new myorder ();
Connection con=my.connection1();
SimpleDateFormat s=new SimpleDateFormat("dd/MM/yyyy");
String querry="select * from order_list";
PreparedStatement psmt1= con.prepareStatement(querry);
ResultSet rs=psmt1.executeQuery();
int i=0;
while(rs.next())
{
	int oid=rs.getInt("o_id");
	int img_id=rs.getInt("Img_id");
	String email=rs.getString("Email_id");
	String status=rs.getString("Status");
	String date=s.format(rs.getDate("Date"));
	
	if(status.equals("Success"))
	{
		%>
		
		<Style>
		
		#b<%=i%>
		{ 
		background: black;
		
		}
		#b<%=i%>:hover {
   
    background: red;
    }
}
		</Style>
		
		<% 
	}
	%>
	
	<div class="tb">

	<form action="user_status"><input name="order_id" value=<%=oid %>><p id="oid"><%=oid %></p><p><%=img_id %><p><%=email%></p><p><%=date %></p><button id="b<%=i %>" name="status" value=<%=status%>><%=status%></button></form>
	
	</div>
	<%
	++i;
}
%>
</div>
<a href="Admine_home.jsp"><p id="pm">Redirect home page ?</p></a>
</body>
</html>