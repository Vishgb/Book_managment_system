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

/*-------------User Status check code------------*/



@WebServlet("/user_status")
public class user_status extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int color;
	 public static String button="";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 button=request.getParameter("status"); 
		int order=Integer.parseInt(request.getParameter("order_id"));
		System.out.print("ankit"+order);
		String querry="update order_list set  Status=? where o_id = ?";
		myorder  my=new myorder ();
		Connection con=my.connection1();
		try {
			
			if(button.equals("Pending"))
			{
				button="Success";
			}
			else {
				button="Pending";
			}
		PreparedStatement psmt1= con.prepareStatement(querry);
		psmt1.setString(1,button);
		psmt1.setInt(2,order);
		 color=psmt1.executeUpdate();
		 if(color>0)
		 {
			 RequestDispatcher rd=request.getRequestDispatcher("/user.jsp");
				rd.include(request, response);
		 }
		 else
		 {
			 RequestDispatcher rd=request.getRequestDispatcher("/user.jsp");
				rd.include(request, response);
		 }
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}

}
