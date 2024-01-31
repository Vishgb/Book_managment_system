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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Statement;
@WebServlet("/hom")
public class Book_home extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static int a;
    static int mid;
    Connection con1;
   
    /*-------------All product data bases fetch  code------------*/
    
    
    
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		 HttpSession hs1=request.getSession();
		 HttpSession hs=request.getSession();
		  ArrayList<String> list=new ArrayList<>();
			 ArrayList<String> title_list=new ArrayList<String>();
			ArrayList<Double> price_list=new ArrayList<>();
			ArrayList<Integer> im_id=new ArrayList<>();
		try {
		connection con=new connection();
		con1=connection.con;
		String Querry="Select * from product";	
		PreparedStatement psmt=con1.prepareStatement(Querry);
		ResultSet rs=psmt.executeQuery();
		int mid=0;
		 int m_id=0;
		for(int i=0;rs.next();i++)
		{
			 String s=rs.getString("img_n");
			 String title=rs.getString("Title");
			 Double price=rs.getDouble("Price");
			  mid=rs.getInt("img_id");
			  im_id.add(i,mid);
//			  
			 title_list.add(i,title);
			 price_list.add(i,price);
			 list.add(i,s);
//			 im_id.add(i,mid);
			hs1.setAttribute("submit_id"+i,mid);
			hs.setAttribute( "key"+i,s);
			hs.setAttribute( "title"+i,title);
			hs.setAttribute( "price"+i,price);
			System.out.print(price);
			System.out.print(title);
			
		}
		
		  System.out.print("cccc"+mid);
		 a=list.size();
		
		 System.out.print("alok"+a);
		  hs1.setAttribute("length", a);
		  System.out.print("++++annu");
//			 
		  
		  /*-------------Admin email and password check  code------------*/
		  
		  
		  
		  if(LoginServlet.email.equals("vishalshrivastava@gmail.com") && LoginServlet.password.equals("vishal@2003"))
			{
					RequestDispatcher r=request.getRequestDispatcher("/Profile.jsp");
					r.include(request, response);
			}
		  else {
		       RequestDispatcher rd=request.getRequestDispatcher("/Book.jsp");
		        rd.include(request, response);
		  }
		 
		}
		catch(Exception e)
		{
			
		}
				
		
		
	}

}
