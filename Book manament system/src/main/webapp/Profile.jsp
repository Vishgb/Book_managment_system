<%@page import="Book.Shoping_book "%>
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
    border-radius: 3px;
    padding-bottom: 0px ;
}
input {
    font-size: 23px;
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
input {
    padding: 2px;
    margin: 13px;
    position: relative;
    left: 55p;
    right: 18px;
}
h3 {
    
    font-size: 26px;
    color: darkred;
    position: relative;
    left: 81px;
    bottom: 30px;
}
#button {
    padding: 11px;
    font-size: 22px;
    /* text-decoration: none; */
    background: #412b1b;
    border: 2px solid;
    border-radius: 6px;
    color: snow;
}
a {
    text-decoration: none;
    color: white;
    text-color: white;
}
input#submit {
    padding: 10px;
    font-size: 24px;
    margin: 24px;
    width: 299px;
    background: cadetblue;
    border: 2px solid;
}
p#ip {
    color: #fffc00;
    font-size: 23px;
    position: absolute;
    bottom: 561px;
    
}


#pm {
    color: blueviolet;
    font-size: 18px;
    position: relative;
    bottom: 204px;
    left: 180px;
}

</style>
</head>
<body>
<div>


<h3>Add Product</h3>
<form action="Admine" method="post" enctype="multipart/form-data">
Title
<input type="text" name="title">
Price
<input type="text" name="price">

<input type="file" name="image1">
<input type="submit"  id="submit"  value="Add image">
</form>
<form action ="hom" method="post">
<a href="Book.jsp"><button  type="submit" id="button">Show All Product</button></a>
</form>
<a href="Admine_home.jsp"><p id="pm">Redirect home page ?</p></a>
</div>

</body>
</html>