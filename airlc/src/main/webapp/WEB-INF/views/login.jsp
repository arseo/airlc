<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Air L&C - Login</title>

  <!-- Custom fonts for this template-->
  <link href="resources/templates/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="resources/templates/css/sb-admin.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
  <script src="resources/templates/vendor/jquery/jquery.min.js"></script>
  <script src="resources/templates/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/templates/vendor/jquery-easing/jquery.easing.min.js"></script>

<script type="text/javascript">
	<!__$(document).ready(function() {
		
		var result = new Array();
		<c:forEach items="${memberList}" var="login">
			var json = new Object();
			json.id = "${memberList.id}";
			json.pw = "${memberList.pw}";
			result.push(json);
			console.log("result: ", result);
		</c:forEach>
		
		$('#loginBtn').click(function(){
			var id = $('#inputEmail').val();
			var pw = $('#inputPassword').val();
			
			for (var i = 0; i < result.length; i++) {
				if (result[i].id == id) {
					if (result[i].pw == pw) {
						console.log("성공");
						location.href = 'home';
					}
				}
			}
		});
		
	});
</script>


</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Remember Password
              </label>
            </div>
          </div>
          <button id="loginBtn" class="btn btn-primary btn-block" >Login</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="register">Register an Account</a>
          <a class="d-block small" href="forgot-password">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>



</body>

</html>
