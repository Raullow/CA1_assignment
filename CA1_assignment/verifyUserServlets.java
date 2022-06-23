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
 * Servlet implementation class verifyUserServlets
 */
@WebServlet("/verifyUserServlets")
public class verifyUserServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifyUserServlets() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		boolean loginStatus2 = true;
		String loginid = request.getParameter("loginid");
		String password = request.getParameter("password");
		String userRole = "Admin";
		
		if(loginid == null || password == null){
			System.out.println("error");
			response.sendRedirect("handleError.jsp");
		}
		
	    try {
	    	
	           Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers
	
	          String connURL = "jdbc:mysql://localhost:3306/db1?user=root&password=12345678&serverTimezone=UTC";
	
	          Connection conn = DriverManager.getConnection(connURL);
	          
	          Statement stmt = conn.createStatement();
	          
	          String name = loginid;
	          String pw = password;
	          
	          String sqlStr = "SELECT name,password from member where name=? and password=?";
	          
	          PreparedStatement ps = conn.prepareStatement(sqlStr);
	          ps.setString(1, name);
	          ps.setString(2, pw);
	         
	          ResultSet rs = ps.executeQuery();  
	          
	          if(rs.next()){
	        	  HttpSession session = request.getSession();
	        	  session.setAttribute("sessUserID", loginid);
	        	  session.setAttribute("sessUserRole", userRole);
					
				  response.sendRedirect("http://localhost:8080/Practicals/prac5/part4/displayMember.jsp?loginid=" + loginid + "&userRole=" + userRole);
	          }
	                     
	           else{
	        	   response.sendRedirect("login.jsp?errCode=invalidLogin"); // Brings user to another webpage 
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
