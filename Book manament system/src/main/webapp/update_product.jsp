<%@page import="Book.ankit"%>
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
<style>
form {
    
    margin-left: 43px;
    position: relative;
    top: 72px;
}


#button {

    margin-top: -13px;
    font-size: 24px;
    padding: 10px;
    margin-left: 128px;
    background: #6ee06e;
    border-radius: 4px;
          
}
input {
    padding: 13px;
    /* margin: 12px; */
    margin-top: 47px;
    font-size: 24px;
    border: 2px solid;
    border-radius: 14px ;
    position: relative;
    top: -68px ;
}
div {
    width: 28%;
    margin: 92px;
    margin-left: 433px;
    height: 517px;
    border: 2px solid;
    border-color: burlywood;
    border-radius: 8px;
    background: antiquewhite;
}
p {
    position: relative;
    font-size: 24px;
    padding: 0px;
    margin: 0px;
    top: -26px;
    left: 10px;
    color: currentColor;
}
#button:hover {
    background: #ec7a7a;
}
body {
    background: #e5e4e4;
}
#p
{

    display: flex;
    justify-content: center;
    position: relative;
    top: 138px;
    /* right: 18px; */
    margin-right: 231px;
    color: darkgreen;
    }
    h3#h {
    display: inline-flex;
    justify-content: center;
    position: relative;
    left: 126px;
    font-size: 26px;
    top:20px;
}
a {
    position: relative;
    top: 128px;
    color: dodgerblue;
    /* font-size: 39px; */
}
#pm{
font-size: 21px;}
</style>
</head>
<body>
<%

 int a=ankit.a;
if(a==1)
{
   out.print("<p id='p'>Update Successful </p>");
}
else if(a==0)
{
	out.print("<p id='p'>Value not Updated</p>");
}
String id=request.getParameter("submit");
  int idi=Integer.parseInt(id);
    myorder  my=new myorder ();
	Connection con=my.connection1();
	String querry="select Title,Price from product where Img_id=?";
	PreparedStatement psmt= con.prepareStatement(querry);
	psmt.setInt(1, idi);
	ResultSet rs=psmt.executeQuery();
	while(rs.next())
	{
		String title=rs.getString("Title");
		String price=rs.getString("Price");
		%>
		<div>
		<h3 id="h">Update Product</h3>
		<form action="update" method="get">
		  <p>Title</p>
		  <input type="text" name="title"  value=<%=title%>><br>
		  <p>Price</p>
		   <input type="text" name="price"  value=<%=price%>><br>
		   <button type="submit"name="submit" id="button" value=<%=idi%>>Update</button>
		</form>
		<a href="delete_product.jsp"><p id="pm">Redirect home page ?</p></a>
		</div>
		
		<% 
		
	}
	con.close();
	
	%>
</body>
</html>