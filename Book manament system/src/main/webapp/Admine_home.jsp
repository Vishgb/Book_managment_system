<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.product {
    width: 90vw ;
    height: -23%;
    display: inline-flex;
    background: #dad7d7;
    border: 2px solid;
    border-radius: 15px;
    margin: 36px;
}
body
{
  
    background: fixed;
    
    }
    img {
    height: 124px;
    padding: 30px;
    /* border: 2px solid; */
}
p#p {
    position: relative;
    /* padding: 133px; */
    top: 162px;
    /* left: 20px; */
    right: 153px;
    font-size: 21px;
}
h3 {
    position: relative;
    top: 17px;
    font-size: 30px;
    color: darkblue;
    left: 32px;
}
#image {
    height: 200px;
    position: relative;
    bottom: 19px;
}
.update {
    position: relative;
    left: -120px;
}
   button {
    color: darkolivegreen;
    font-size: 36px;
    display: flex;
    position: relative;
    justify-content: center;
    text-decoration: none;
    position: relative;
    left: 624px;
    top: 26px;
    padding: 12px;
    border: 2px solid;
    border-radius: 13px;
    background: #67ffff;
}
button:hover {
    background: border-box;
    background: #d6f9d6;
} 
a#a {
    position: relative;
    left: 23px;
}
    </style>
</head>
<body>


<h3>Hello Admin !</h3>
<div class="product">
<a href="Profile.jsp"><img src="imgs/add.png" alt="add image"></a>
<p id="p"  class="update">Add Product</p>
<a href="delete_product.jsp"><img src="imgs/update.png" id="image" alt="update image"></a>
<p id="p">Update Product<p>
<a href="delete_product.jsp"><img src="imgs/delete.png" alt="delete image"></a>
<p id="p">Delete Product<p>
<a href="user.jsp" id="a"><img src="imgs/i.png" alt="show user"></a>
<p id="p" id="show">Show User Product Order<p>
</div>
<a href="logout"><button>Logout</button></p></a>
</body>
</html>