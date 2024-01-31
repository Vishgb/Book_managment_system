package Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 /*-------------In Database product details  add code------------*/
	
	
       
	Connection con;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Book_home bk=new Book_home();
		  int a=0;
	      PrintWriter out=response.getWriter();
			String c=request.getParameter("submit");
			System.out.println("shrivastva"+c);
			int bid=Integer.valueOf(c);
			
		try {	
		connection con1=new connection();
	     con=connection.con;
	    
		String querry="insert into order_list(img_id,Email_id,Status,Date) values(?,?,'Pending',now())";
		PreparedStatement psmt=con.prepareStatement(querry);
		psmt.setInt(1,bid );
		psmt.setString(2, LoginServlet.email_id);
		 a=psmt.executeUpdate();
		
		
		}
		catch(Exception e)
		{
			out.print(e);
			RequestDispatcher rd=request.getRequestDispatcher("/Book.jsp");
			rd.include(request, response);
		}
		finally {
			try {
				con.close();
				
			}
			catch(Exception e)
			{
				System.out.print(e);
				out.print(e);
			}
		}
		if(a>0)
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("/ORDERLIST.jsp");
			rd.include(request, response);
		    
		}
		else
		{
			
			response.setContentType("text/html");
			out.print("<h3 style= color:green>ORDER FAILED</h3>");
			RequestDispatcher rd=request.getRequestDispatcher("/Book.jsp");
			rd.include(request, response);
		}
	
	}

		
}


