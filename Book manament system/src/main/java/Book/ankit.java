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

@WebServlet("/update")
public class ankit extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	public static int a=3;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myorder  my=new myorder ();
		Connection con=my.connection1();
		String Title=request.getParameter("title");
	    double  Price=Double.parseDouble(request.getParameter("price"));
	    int idi=Integer.parseInt(request.getParameter("submit"));
	    try {
		String Querry="Update product set Title=?, Price=? where Img_id=?";
		PreparedStatement psm= con.prepareStatement(Querry);
		psm.setString(1,Title);
		psm.setDouble(2,Price);
		psm.setInt(3,idi);
	     a=psm.executeUpdate();
		if(a>0)
		{
			response.setContentType("text/html");
			RequestDispatcher rd=request.getRequestDispatcher("/update_product.jsp");
			rd.include(request, response);
			
		}
		else
		{
			response.setContentType("text/html");
			RequestDispatcher rd=request.getRequestDispatcher("/update_product.jsp");
			rd.include(request, response);
		}
	    }
	    catch(Exception e)
	    {
	    	System.out.print(e);
	    	response.setContentType("text/html");
			RequestDispatcher rd=request.getRequestDispatcher("/update_product.jsp");
			rd.include(request, response);
	    }
	    /*-------------Database connection close code------------*/
	    finally
	    {
	    	try
	    	{
	    		con.close();
	    	}
	    	catch(Exception e)
	    	{
	    		System.out.print(e);
		    	response.setContentType("text/html");
				RequestDispatcher rd=request.getRequestDispatcher("/update_product.jsp");
				rd.include(request, response);
	    	}
	    }
		
	}

	

}
