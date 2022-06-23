<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <!-- JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
</head>
<style>
	body {
  		height: 100%;
	}
	
	body {
	  display: flex;
	  align-items: center;
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #f5f5f5;
	}
	
	.form-register {
	  width: 100%;
	  max-width: 330px;
	  padding: 15px;
	  margin: auto;
	}
		
	.form-register .form-floating:focus-within {
	  z-index: 2;
	}

	.form-register .button {
	  background-color: #0D6EFD; 
	  border: none;
	  color: white;
	  padding: 14px 90px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  border-radius: 8px;
	  margin-top: 50px;
	}
			
	.form-register input[type="email"] {
	  margin-bottom:-1;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
</style>
<body class="text-center">
  <main class="form-register">
    <form action="/CA1_assignment/RegisterManager" method="post">
      <h1>
        <span style="color: red">SP</span>
        <span style="color: black">Tours!</span>
      </h1>
      <h1 class="h3 mb-3 fw-normal">Enter your details here</h1>

      <div class="form-floating">
        <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Username" />
        <label for="inputUsername">Username</label>
      </div>
      <div class="form-floating">
        <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder=name@example.com />
        <label for="inputEmail">Email Address</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" />
        <label for="inputPassword">Password</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="inputCfmPassword" name="inputCfmPassword" placeholder="CfmPassword" />
        <label for="inputCfmPassword">Confirm Password</label>
      </div>
      <div class="form-floating">
        <input type="tel" class="form-control" id="inputContactNo" name="inputContactNo" placeholder="ContactNo" />
        <label for="inputContactNo">Contact Number</label>
      </div>
      

      <button class="button" type="submit" id="register">
        Register Now
      </button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
    </form>
  </main>

</body>
</html>