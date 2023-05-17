package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		try{
    			PrintWriter out=response.getWriter();
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/auctionsys","root","sasumithu");
    			String na=request.getParameter("txtName");
    			String pw=request.getParameter("txtPwd");
    			
    			
    			PreparedStatement prstmt= con.prepareStatement("select username,id,isadmin,isrep from login where username=? and password=?");
    			prstmt.setString(1,na);
    			prstmt.setString(2, pw);
    			ResultSet rs=prstmt.executeQuery();
    			
    			if(rs.next()) {
    				if(Integer.valueOf(rs.getString("isadmin"))==1) {
    					String val=String.valueOf(rs.getInt(2));
    					HttpSession session = request.getSession();
    					session.setAttribute("name", val);
    					RequestDispatcher rd= request.getRequestDispatcher("Admin_welcome.jsp");
        				rd.forward(request, response);
    				}
    				else {
    					if(Integer.valueOf(rs.getString("isrep"))==1) {
        					String val=String.valueOf(rs.getInt(2));
        					HttpSession session = request.getSession();
        					session.setAttribute("name", val);
        					RequestDispatcher rd= request.getRequestDispatcher("rep_welcome.jsp");
            				rd.forward(request, response);
        				}
    					else {
    					String val=String.valueOf(rs.getInt(2));
    					HttpSession session = request.getSession();
    					session.setAttribute("name", val);
            			RequestDispatcher rd1=request.getRequestDispatcher("/user_welcome.jsp");
            			rd1.forward(request, response);
        				}
    				}
    				/*out.println("<font color=red size=18>Login Successful!!<br>");
    				out.println("<a href=login.jsp color= Black> Logout</a>");*/
    			}
    			else
    			{
    				out.println("<font color=red size=18>Login Failed!!<br>");
    				out.println("<a href=StartPage.jsp> Try Again</a>");
    			}
    			
    		}
    		catch (ClassNotFoundException e) {
    			e.printStackTrace();
    		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
