<%@page import="Book.LoginServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    justify-items: center;
    align-self: center;
    margin-top: 119px;
}
h2 {
    display: flex;
    justify-content: center;
    font-size: 34px;
}
form {
    font-size: 27px;
    padding: 11px;
    position: relative;
    right: -7px;
}
div {
    background:#85ff5f;
    width: 353px;
    padding: 34px;
    border: 2px solid;
    border-radius: 3px
}
input {
    font-size: 23px;
}
#submit {
    padding: px;
    font-size: 31px;
    width: 104%;
    padding: 3px;
    position: relative;
    top: 38px;
    right: 21px;
    background: cyan;
}
#submit:hover
{
background: green;

}
a {
    padding: 27px;
    display: flex;
    font-size: 31px;
    color: indigo;
    position: relative;
    top: 36px;
    right: 31px;
}
a:hover
{
color:red;}
body {
    background: #231414;
}
p#invalid {
    display: inline-flex;
    color: red;
    font-size: 19px;
    margin-left: 51px;
}
</style>
</head>
<body>
<div>
<%
if(LoginServlet.a==0)
{
	out.print("<p id='invalid'>Invalid Email and Password</p>");
	LoginServlet.a=3;
}
%>


<h2> Welcome to login page</h2> <br>
<form action="Loginpage" method="post">
<p> Email id</p>
  <input type="text" name="email" required ><br>
  <p>Password</p>
  <input type="password"  name="password" required><br>
  <input type="submit" id="submit" value="Login"> <br>
  </form>
   <a href="Register.jsp">Register</a>
   </div>
</body>
</html>