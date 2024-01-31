package Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/Admine")
@MultipartConfig
public class Shoping_book extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int a;
	
	 /*-------------In Database Add product details code------------*/
	
	static Connection con1;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String title=request.getParameter("title");
		String price=request.getParameter("price");
		double price_double=Double.valueOf(price);
		Part part=request.getPart("image1");
		String url=part.getSubmittedFileName();
		
		String path=getServletContext().getRealPath("imgs")+File.separator+url;
		FileOutputStream fos=new FileOutputStream(path);
		InputStream is= part.getInputStream();
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		connection Connection=new connection();
		con1=connection.con;
		
		try {
		String querry="insert into product(img_n,Title,Price)values(?,?,?)";
		PreparedStatement psmt=con1.prepareStatement(querry);
		psmt.setString(1,url);
		psmt.setString(2,title);
		psmt.setDouble(3,price_double);
		 a=psmt.executeUpdate();
		if(a>0)
		{
			response.setContentType("text/html");
			out.print("<p id='ip'>Add Product Successful</p>");
			RequestDispatcher rd=request.getRequestDispatcher("/Profile.jsp");
			rd.include(request, response);
		}
		else
		{
			response.setContentType("text/html");
			out.print("<p id='ip'>value not insert </p>");
				
			RequestDispatcher rd=request.getRequestDispatcher("/Profile.jsp");
			rd.include(request, response);
		}
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		finally
		{
			try
			{
				con1.close();
			}
			catch(Exception e)
			{
				System.out.print(e);
		}
			
		}
		
	}
	

}

