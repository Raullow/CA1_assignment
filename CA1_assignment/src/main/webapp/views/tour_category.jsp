<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tour_category.jsp</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</head>
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
		//Step 5: Execute SQL Command
		String sqlStr = "SELECT * FROM category";
		ResultSet rs = stmt.executeQuery(sqlStr);
		int image = 0;
	%>
		<div class="row">
	<%	while (rs.next()) { %>
		<div class="col-4">
			<div class="card">
			  <img class="card-img-top" width="200" height="200" src="../images/cat<%out.print(++image);%>.jpg" alt="Card image cap">
			  <div class="card-body">
			    <h5 class="card-title"><%out.println (rs.getString("category")); %></h5>
			    <p class="card-text"><%out.println (rs.getString("category_description")); %></p>
			    <a href="tour.jsp?categoryid=<%out.println(rs.getString("id")); %>" class="btn btn-primary">Tours</a>
			  </div>
			</div>
		</div>
		
	<%	}	%>
		</div>
	<%
		// Step 7: Close connection
		conn.close();
		} catch (Exception e) {
		out.println("Error :" + e);
		}
	%>
</body>
</html>