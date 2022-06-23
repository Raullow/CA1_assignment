package servlets;

import java.io.IOException;

import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginManager
 */
@WebServlet("/LoginManager")
public class LoginManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String email = request.getParameter("inputEmail");
		String password = request.getParameter("inputPassword");
		
		if(email.equals("") || password.equals("")){
			System.out.println("error");
			response.sendRedirect("/CA1_assignment/forms/login.jsp?invalidLogin");
		}
		try {
	           Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers
	          String connURL = "jdbc:mysql://localhost:3306/tour_db?user=root&password=12345678&serverTimezone=UTC";
	
	          Connection conn = DriverManager.getConnection(connURL);
	          
	          Statement stmt = conn.createStatement();
	          
	          String em = email;
	          String pw = password;
	          
	          String sqlStr = "SELECT id,email,password,role from member where email=? and password=?";
	          
	          PreparedStatement ps = conn.prepareStatement(sqlStr);
	          System.out.print("3");
	          ps.setString(1, em);
	          ps.setString(2, pw);
	          
	          ResultSet rs = ps.executeQuery();  
	          
	          if(rs.next()){
	        	  HttpSession session = request.getSession();
	        	  session.setAttribute("sessUserID", rs.getString("id"));
	        	  session.setAttribute("sessUserRole", rs.getString("role"));
				  System.out.print("role: " + rs.getString("role"));
				  response.sendRedirect("http://localhost:8080/CA1_assignment/index.jsp?role=" + rs.getString("role"));
	          }
	                     
	           else{
	        	   response.sendRedirect("/CA1_assignment/forms/login.jsp?invalidLogin"); // Brings user to another webpage 
	           }
	          conn.close();
	          
	          System.out.println("Woots");
	          
	     } catch (Exception e) {
	    	 System.out.println("Error :" + e);
	     }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
