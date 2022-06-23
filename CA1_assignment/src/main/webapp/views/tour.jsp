<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour.jsp</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</head>
<style>
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }
</style>

<%@ include file = "/views/header.html" %>
<body>
	<%@page import ="java.sql.*"%>
	<%
		 try {
			 // Step1: Load JDBC Driver – TO BE OMITTED for newer drivers
			 Class.forName("com.mysql.jdbc.Driver");
			 // Step 2: Define Connection URL
			 String connURL =
			"jdbc:mysql://localhost:3306/tour_db?user=root&password=12345678&serverTimezone=UTC";
			 // Step 3: Establish connection to URL
			 Connection conn = DriverManager.getConnection(connURL);
			
			 // Step 4: Create Statement object
			 Statement stmt = conn.createStatement();
			 
			 int categoryid = Integer.parseInt(request.getParameter("categoryid"));
			 
			//Step 5: Execute SQL Command
			String sqlStr = "SELECT * FROM tour WHERE categoryid = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
	        ps.setInt(1, categoryid);
	       
	        ResultSet rs = ps.executeQuery(); 
	        
	        while(rs.next()){
	        	out.println("name: " + rs.getString("tour_name"));
	            out.println("description: " + rs.getString("breif description_description"));
	        }
		 }
		catch (Exception e) {
			out.println("Error :" + e);
		}
	%>
</body>
<%@ include file = "/views/footer.html" %>
</html>