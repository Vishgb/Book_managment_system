package Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Registerpage")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 static String name1,email1,password1;
  /*-------------Register ServletRequest code------------*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		 name1=request.getParameter("name");
		 email1=request.getParameter("email");
		 password1=request.getParameter("password");
		 String co="";
		 if(name1==co || email1==co || password1==co)
		 {
			 response.setContentType("text/html");
			 out.print("<p style='color:red'>Please fill all box</p>");
			 RequestDispatcher rs=request.getRequestDispatcher("/Register.jsp");
			 rs.include(request, response);
		
		 }
		 else {
		 connection con=new connection();
		 con.setdataRegister();
		 int a=10;
		 try
		 {
		  a=con.Insertdata();
		 }
		 /*-------------duplicate user not register ServletRequest code------------*/
		 catch(Exception e)
		 {
			 response.setContentType("text/html");
			out.print("<p id='invailid'>Email alrrady exist</p>"); 
			RequestDispatcher rsm=request.getRequestDispatcher("/Register.jsp");
			 rsm.include(request, response);
			
		 }
		 if(a==1)
		 {
			 response.setContentType("text/html");
			 out.print("<p id='invailid' style='color:green'>Registration Successful</p>");
			 RequestDispatcher rs=request.getRequestDispatcher("/Register.jsp");
			 rs.include(request, response);
		 }
		 if(a==0)
		 {
			 response.setContentType("text/html");
			 out.print("<p style='color:red'>Registration Faild</p>");
			 RequestDispatcher rs=request.getRequestDispatcher("/Register.jsp");
			 rs.include(request, response);
			
		 }
		 
		}
	}
	

}
/*------------- Database connection  code------------*/
class connection

{
	 static Connection con;
	 static private String name,password;
	 static int check;
	 static String name1,email;
	 
	public void setdataRegister()
	{
//		RegisterServlet servlet=new RegisterServlet();
		
		this.name=RegisterServlet.name1;
		this.email=RegisterServlet.email1;
		this.password=RegisterServlet.password1;
		System.out.print(name);
		System.out.print(email);
	
	}
	public void setdatalogin()
	{
		this.email=LoginServlet.email;
		this.password=LoginServlet.password;
	}
	public connection()
	{
		try {
		
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    System.out.print(email);
		String url="jdbc:mysql://localhost:3306/book_system";
	    con= DriverManager.getConnection(url,"root","");
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}

	
	/*-------------insert data database ServletRequest code------------*/
	
	
	public int  Insertdata()throws Exception 
	{
		try {
		
		String Querry="Insert into user values(?,?,?)";
		PreparedStatement psmt=con.prepareStatement(Querry);
		psmt.setString(1, email);
		psmt.setString(2, password);
		psmt.setString(3,name);
		check=psmt.executeUpdate();
		}

	catch(ArithmeticException e)
	{	
		System.out.print(e);
		
		
		}	
	finally
	{
		try {
		
		con.close();
		}
		catch(NullPointerException e)
		{
			System.out.print(e);
		}
	}

		return check;
}
	
	
	
	/*-------------Login user ServletRequest code------------*/
	
	
	
	public int Check_valid_user() throws Exception
	{
		int a=0;
		
		try {
			
		String Querry="select Password from user where Email_id=? ";
		PreparedStatement psmt=con.prepareStatement(Querry);
		psmt.setString(1,email);
	    ResultSet rs=psmt.executeQuery();
	    String password1=" ";
	    while(rs.next())
	    {
	       password1=rs.getString("Password");	
	    	
	       }
	    if(password1.equals(password))
	    {
    	  a=1;
    	 
    	  String querry="select Name from user where Email_id=? ";
    	  PreparedStatement psm=con.prepareStatement(querry);
    	  psm.setString(1, email);
    	  ResultSet rsm=psm.executeQuery();
    	  while(rsm.next())
    	  {
    		   name1=rsm.getString("Name");
    		   
    		
    	  }
    	
	    }
	  
		}
		catch(ArithmeticException e)
		{	
			System.out.print(e);
		
			}	
		finally
		{
			try {
			
			con.close();
			
			}
			catch(NullPointerException e)
			{
				System.out.print(e);
			}
		}
		
		return a;
		
	}
	
	
	
	
}
