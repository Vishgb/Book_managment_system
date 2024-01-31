package Book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/o_delete")
public class o_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   public static int a=6;
   
   
   
   /*-------------User product cancel code------------*/
   
   
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id1=Integer.parseInt(request.getParameter("sub"));
		    myorder  my1=new myorder ();
		   	Connection con1=my1.connection1();
		   	String q="delete from order_list where o_id=?";
		   	try {
		   	PreparedStatement pre= con1.prepareStatement(q);
		   	pre.setInt(1,id1);
		   	a=pre.executeUpdate();
		   	if(a>0)
		   	{
	                response.setContentType("text/html");
				RequestDispatcher rd=request.getRequestDispatcher("/myorderjsp.jsp");
				rd.include(request, response);
		   		
		   	}
		   	else
		   	{
	             response.setContentType("text/html");
				
				RequestDispatcher rd=request.getRequestDispatcher("/myorderjsp.jsp");
				rd.include(request, response);
		   		
		   	}
		   	}
		   	catch(Exception e)
			{
				System.out.print(e);
				RequestDispatcher rd=request.getRequestDispatcher("/myorderjsp.jsp");
				rd.include(request, response);
			}
		   	finally {
		   		
		   		try {
		   			con1.close();
		   		}
		   		catch(Exception e)
		   		{
		   			System.out.print(e);
					RequestDispatcher rd=request.getRequestDispatcher("/myorderjsp.jsp");
					rd.include(request, response);
		   		}
		   	}
		   	
		
	}

	

}
