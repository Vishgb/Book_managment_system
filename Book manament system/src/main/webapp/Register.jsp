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
p#invailid {
    color: red;
    position: relative;
    bottom: 327px;
    left: 315px;
    font-size: 21px;
    background: #aaeeaa;
    padding: 13px;
}
</style>
</head>
<body>
<div>
<form action="Registerpage" method="post">
<h2> Register </h2>
<p> Name</p>
    <input type= "text"  name="name" pattern="[A-Z a-z]{1,20}" required>
    <p>Email id</p>
    <input type="email" name="email"  required >
    <p>Password </p>
    <input type="password" name="password" pattern="[A-Z a-z 0-9]{1,10}" required><br><br>
    <input type ="submit" id="submit" value="Register">
  
</form><br>

     <a href="Login.jsp">Login</a>
     </div>
</body>
</html>