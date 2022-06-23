<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberEdit.jsp</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.25.0/axios.min.js"
    integrity="sha512-/Q6t3CASm04EliI1QyIDAA/nDo9R8FQ/BULoUFyN4n/BDdyIxeH7u++Z+eobdmr11gG5D/6nPFyDlnisDwhpYA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
</head>
<body>
	<%@page import ="java.sql.*"%>
	<% 
		String username = "";
		String email = "";
		String password = "";
		String contact = "";
		//testing code
		session.setAttribute("sessUserID", 2);
		Integer sessID = (Integer)session.getAttribute("sessUserID");
		
		if(sessID == null){
			response.sendRedirect("/CA1_assignment/forms/login.jsp");
		}
        
		 try {
			 
			 Class.forName("com.mysql.jdbc.Driver");
			 
			 String connURL =
			"jdbc:mysql://localhost:3306/tour_db?user=root&password=12345678&serverTimezone=UTC";

			 Connection conn = DriverManager.getConnection(connURL);
			
			 Statement stmt = conn.createStatement();
			 
			 String sqlStr = "SELECT * FROM member WHERE id = ?";
			
			 PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, sessID);
			
			ResultSet rs = ps.executeQuery(); 
			
			while(rs.next()){
				username = rs.getString("username");
				email = rs.getString("email");
				password = rs.getString("password");
				contact = rs.getString("contact_number");
			}
		 } 
		 catch (Exception e) {
			out.println("Error :" + e);
		}
	%>
	<form action="/CA1_assignment/MemberManager" method="post">
	  <div class="form-group">
	    <label for="inputUsername">Username</label>
	    <input type="text" class="form-control" id="inputUsername" name="inputUsername" value="<%out.print(username);%>" />
	    
	  	<label for="inputEmail">Email address</label>
        <input type="text" class="form-control" id="inputEmail" name="inputEmail" value="<%out.print(email);%>" />
        
        <label for="inputPassword">Password</label>
        <input type="password" class="form-control" id="inputPassword" name="inputPassword" value="<%out.print(password);%>" />
        
        <label for="inputCfmPassword">Password</label>
        <input type="password" class="form-control" id="inputCfmPassword" name="inputCfmPassword" value="<%out.print(password);%>" />
        
        <label for="inputContact">Password</label>
        <input type="tel" class="form-control" id="inputContact" name="inputContactNo" value="<%out.print(contact);%>" />
        
        <button class="w-100 btn btn-lg btn-primary" type="submit" id="edit">
        Edit
      	</button>
	  </div>
	</form>
</body>
</html>