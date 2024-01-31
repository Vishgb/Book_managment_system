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

@WebServlet("/delete")
public class myorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int a=3;
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		PrintWriter out= response.getWriter();
		String id=request.getParameter("submit1");
		int id1=Integer.parseInt(id);
//		String img=request.getParameter("imid");
//		int im=Integer.parseInt(img);
		try {
		
		Connection con=connection1();
		String querry="delete from product where Img_id=?";
		PreparedStatement psmt=con.prepareStatement(querry);
		psmt.setInt(1,id1);
	      a=psmt.executeUpdate();
		if(a>0)
		{
			response.setContentType("text/html");
			 out.print("<p id='ip'>Value Delete Successful</p>");
			RequestDispatcher rd=request.getRequestDispatcher("/delete_product.jsp");
			rd.include(request, response);
		}
		else
		{
			response.setContentType("text/html");
		
				out.print("<p id='ip'>Value not Deleted </p>");
				
			RequestDispatcher rd=request.getRequestDispatcher("/delete_product.jsp");
			rd.include(request, response);
		}
	}
		catch(Exception e)
		{
			out.print(e);
		}
  }
  
	public Connection connection1()
	{
		connection con=new connection();
		Connection con1=connection.con;
		return con1;
		}
//	public void delete ()
//	{
//		
//	}

}
