package Book;
import javax.servlet.RequestDispatcher;
//import jakarta.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/Loginpage")
/*-------------Login user code------------*/
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	static String email;
	static String password;
	static String email_id;
	public static int a=3;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 email=request.getParameter("email");
		 password=request.getParameter("password");
		 PrintWriter out=response.getWriter();
		 
		 /*-------------Admin email and password check  code------------*/
		 
		 
		connection con=new connection();
		con.setdatalogin();
		try
		{
		if(email.equals("vishalshrivastava2003@gmail.com") && password.equals("vishal@2003"))
		{
			HttpSession hs1=request.getSession();
			 hs1.setAttribute( "key1","Admine");
				RequestDispatcher rs=request.getRequestDispatcher("/Admine_home.jsp");
				  rs.include(request, response);
			
			}
		
	 else 
	 {
				
			   a=con.Check_valid_user();
			   
			
		
		 if(a==1)
		 { 
			
			 HttpSession hs=request.getSession();
			 hs.setAttribute( "key",con.name1);
//			 hs.setAttribute("key_email", con.email1);
			 email_id=con.email;
			 hs.setAttribute( "key_email",email_id);
			 
			 response.setContentType("text/html");
//			out.print("<p style= color:green>Login Successful</p>"); 
			RequestDispatcher rs=request.getRequestDispatcher("/start.jsp");
			rs.include(request, response);
			
		 }
		 else if(a==0)
		 {
			 response.setContentType("text/html");
			 
			 RequestDispatcher rs=request.getRequestDispatcher("/Login.jsp");
			 rs.include(request, response);
		 }
	 }
		}
		catch(Exception e)
		
		{
			response.setContentType("text/html");
			out.print(e);
			RequestDispatcher rs=request.getRequestDispatcher("/Login.jsp");
			rs.include(request, response);
		}
		
	}

}

