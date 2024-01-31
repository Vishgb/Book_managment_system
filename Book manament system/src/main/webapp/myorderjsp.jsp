
<%@page import="Book.o_delete"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Book.LoginServlet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Book.myorder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="sty.css"  type="text/css"/>
<style type="text/css">
body {
    background: #cfc0c0;
}
#order
{ display : flex;
 justify-content :center;
 background: lavender;
 padding: 0px;
    margin: 25px;
    
    border: 2px solid;
    border-radius: 20px;
    }
    
   
}
img {
    border: 2px solid;
    height: 297px;
    padding: 0px;
    margin: -47px;
    position: relative;
     
}
img{

bottom: 1px;
}

h3 {
    display: inline-flex;
    justify-content: center;
    position: relative;
    bottom: 330px;
    
    font-size: 20px;
    left: 185px;
    
    }
    
    button {
    display: inline-flex;
    position: relative;
    bottom: 277px;
    left: -32px ;
    padding: 23px;
    height: -9px;
    font-size: 27px;
    background: red;
    border: 2px solid;
    border-radius: 6px;
}
main{
margin-bottom: -136px;
margin-bottom: -299px;
position: relative;
    top: 129px;

}
button:hover {
    background: #0ea72b;
   }
 #price {
    background: #16a5a5;
    padding: 5px;
}
header{

z-index:1;
width:97%;
margin-left: 11px;

 }
 p#op {
    display: inline-flex;
    /* display: none; */
    position: relative;
    top: 4px;
    left: 46%;
    /* justify-content: center; */
    /* align-items: center; */
    font-size: 20px;
    color: red;
}
form {
    position: relative;
    /* top: 39px; */
    margin-bottom: 145px;
}
h3.status {
    position: relative;
    left: 75%;
    bottom: 413px;
    /* margin-bottom: 52px; */
    /* top: 481px; */
    /* z-index: 2; */
    background: gainsboro;
    padding: 4px;
    color: #ff0000;
    font-size: 29px;
}
button#Done {
    background: green;
    color: antiquewhite;
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

<% 

String email=(String)session.getAttribute("key_email");
try{
	ArrayList<String>im_name=new ArrayList<>();
	ArrayList<String>title=new ArrayList<>();
	ArrayList<String>price=new ArrayList<>();
	ArrayList<Integer>oid=new ArrayList<>();
	ArrayList<Integer>im_id=new ArrayList<>();
	ArrayList<String>status=new ArrayList<>();
	int a;
	myorder  my=new myorder ();
	Connection con=my.connection1();
    String  querry="select o_id,img_id,Status from order_list where Email_id=?";
    PreparedStatement psmt=con.prepareStatement(querry);
    psmt.setString(1,email);
    ResultSet rs=psmt.executeQuery();
    
    for(int i=0; rs.next();i++)
    {
    	int id=rs.getInt("o_id");
    	oid.add(i,id);
    	int im=rs.getInt("img_id");
    	im_id.add(i,im);
    	String st=rs.getString("Status");
    	status.add(i,st);
    	
    }
    for(int j=0;j<im_id.size();j++)
    {
    	
    int mi=im_id.get(j);
    String Querry="select img_n,Title,Price from product where Img_id=?";
    PreparedStatement ps=con.prepareStatement(Querry);
    ps.setInt(1,mi);
    ResultSet rs1=ps.executeQuery();
    int i=0;
    while(rs1.next())
    {
    	String m=rs1.getString("img_n");
    	im_name.add(i,m);
    	String t=rs1.getString("Title");
    	title.add(i, t);
    	String p=Double.toString(rs1.getDouble("Price"));
    	price.add(i,p);
    	i++;
    	
       }
    }
    
     a=oid.size()-1;
    
   
    for(int i=0;i<title.size();i++)
    {
    	
    %>
   
    <main>
    
     <%
    int d=o_delete.a;
     System.out.print("maharaj"+d);
if(d==1)
{
 out.print("<p id='op'>Order Cancel Successful</p>");
 o_delete.a=3;
 d=3;
 
 
 
}
if(status.get(i).equals("Success"))
{
	%>
	<style>
	#a<%=i%>
	{
	color:green;
	}
	</style>
	<% 
	
}

%>
    
     <form action="o_delete" method="get">
    <div id="order">
    <img src="imgs/<%=im_name.get(a)%>" alt="photo"><br>
      </div>
    <h3>Title  -  <%=title.get(i)%></h3><br><br>
    <h3 id="price">Price  -  <%=price.get(i)%> Rs</h3><br><br>
    <h3>Your Order Id  :  <%=oid.get(i)%></h3><br><br>
    <h3 class="status" id="a<%=i%>">Status -    <%=status.get(i)%></h3>
    <% if(status.get(i).equals("Success"))
    {
    	%>
    	<button type="button" id="Done">Done</button><br>
    	<%
    }
    else
    {
    	%>
    	 <button type="submit"id="button1" name="sub" value="<%=oid.get(i)%>">Cancel</button><br>
    	<%
    }
    %>
  </form>
    
    </main> 
    
 <%
 System.out.print("duggu"+i);
   a--;
    }
    
     }

        catch(Exception e)
        {
			
           }

%>


</body>
</html>