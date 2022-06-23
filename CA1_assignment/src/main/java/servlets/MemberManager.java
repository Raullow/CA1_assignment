package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberManager
 */
@WebServlet("/MemberManager")
public class MemberManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String username = request.getParameter("inputUsername");
		String email = request.getParameter("inputEmail");
		String password = request.getParameter("inputPassword");
		String cfmPassword = request.getParameter("inputCfmPassword");
		String contact = request.getParameter("inputContactNo");
		
		if(username.equals("") || email.equals("") || password.equals("") || cfmPassword.equals("") || contact.equals("")){
			System.out.println("null input");
			response.sendRedirect("/CA1_assignment/forms/memberEdit.jsp?invalidInput");
		}
		else if(!password.equals(cfmPassword) || !cfmPassword.equals(password)) {
			System.out.println("password does not match");
			response.sendRedirect("/CA1_assignment/forms/memberEdit.jsp?invalidPassword");
		}
		else {
			try {
		           Class.forName("com.mysql.jdbc.Driver");  //can be omitted for newer version of drivers
		          String connURL = "jdbc:mysql://localhost:3306/tour_db?user=root&password=12345678&serverTimezone=UTC";
		
		          Connection conn = DriverManager.getConnection(connURL);
		          
		          Statement stmt = conn.createStatement();
		          
		          String un = username;
		          String em = email;
		          String pw = password;
		          String cn = contact;
		          HttpSession session = request.getSession();
		          Integer sessID = (Integer)session.getAttribute("sessUserID");
		          
		          String sqlStr = "UPDATE member SET username= '" + un + "', password='" 
		        		  		+ pw + "', email= '" + em + "', contact_number='" + cn + "' WHERE id=" + sessID;
		          
		          int numRowsAffected = stmt.executeUpdate(sqlStr);
		          
		          response.sendRedirect("/CA1_assignment/forms/memberEdit.jsp");

		                     
		          conn.close();
		          
		          System.out.println("Woots");
		          
		     } catch (Exception e) {
		    	 System.out.println("Error :" + e);
		     }
		}

	}

}
