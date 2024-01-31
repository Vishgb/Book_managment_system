<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

.c1 {
    padding: 79px;
    border: 7px solid;
  
    display: inline-flex;
    width: 79%;
    border-radius: 69px;
}

.c1 {
    margin: 58px;
    height: 366px;
    background: #191900;
    margin-top:163px;
    }
img
{
  height : 315px;
  border: 2px solid;
    margin-top: 0px;
    border-color: mediumvioletred;
    border-radius: 21px;
    background: lightslategray;


  
  }
    
 h4 {
    border: 1px solid;
    border-radius: 7px;
    text-align: center;
    background: #b4bbdf;
    padding: 8px;
    margin-right: 106px ;
    font-size: 23px;
    margin-top:99px;
    width:214px;
    height:92px;
    margin-left: 45px;
    border-color: #c4ed00;
}
button#button {
    height: 39px;
    padding: 44px;
    font-size: 38px;
    padding-bottom: 89px;
    margin-top: 87px;
   
    margin-left: 206px;
    border: 3px solid;
    border-radius: 15px;
    border-color: #7200f9;
    background: #6dffec;
    text-shadow: -16px;
    border-style: dashed;
}

#num
{
display: none
}

body {
    background: #240b3b;
}
form{
display: inline-flex;}
#button:hover {
    background: #0ea72b;
   }
   #button:active
   {
    background: #0ea72b;
   }
</style>
<link rel="stylesheet" href="sty.css"  type="text/css"/>
</head>
<body>
<header>
<nav>
<div class="nav-bar">
<a href="Book.jsp">Home</a>
<a href="user_profile.jsp">Profile</a>
<a href="myorderjsp.jsp">Order list</a>
<a href="logout" id="l">Logout</a>
</div>
</nav>
</header>

<%  
  int b = (int)session.getAttribute("length");
//int idi = (int)session.getAttribute("submit_id");
//int t = (int)session.getAttribute("length_t");
//int p = (int)session.getAttribute("length_p");
String img[]=new String[10];
String title[]=new String[10];
String price[]=new String[10];
int d[]=new int[10];

for(int i=0;i<=b-1;i++)
{
    d[i]= (int)session.getAttribute("submit_id"+i);
   img[i] = (String)session.getAttribute("key"+i);
   title[i]=(String)session.getAttribute("title"+i);
   price[i]=Double.toString((Double)session.getAttribute("price"+i));
  
   %>
   <main>
    <div class="c1">
    <form action="order" method="get">
    <img  src="imgs/<%= img[i] %>">
    <h4>Title -  <%= title[i] %><br><br>
     Price - <%= price[i] %> Rs</h4><br><br>
    <button type="submit" id="button" name="submit" value="<%=+d[i] %>">Order</button>
    </form>
   </div>
   </main>
    <% 
    //idi--;
  }

%>

<%


%>


<footer></footer>

</body>
</html>