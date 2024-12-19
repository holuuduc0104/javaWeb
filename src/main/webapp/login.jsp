<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="style_login.css">

<title>Login Form</title>
</head>

<body>
	<div class="container-fluid">
		<form class="mx-auto form-login" action="login" method="post"
			id="form-1">
			<h4 class="text-center">Login</h4>


			<%-- <c:if test="${not empty failedMsg }">
				<p class="text-center text-danger">${failedMsg }</p>
				<c:remove var="failedMsg" scope="session" />
			</c:if> --%>

			<span> </span>
			<div class="form-group mb-3 mt-5">
				<label for="email" class="form-label">Email</label> <input
					type="text" class="form-control" name="email" id="email"> <span
					class="form-message"></span>
			</div>

			<div class="form-group mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" name="password" id="password">
				<span class="form-message"></span>
			</div>

			<input type="submit" name="submit" class="btn btn-primary mt-5"
				value="Login">
			<p class="text-center mt-3">
				Do not have an account? <a href="register.jsp"
					style="text-decoration: none;">Register now</a>
			</p>
		</form>
	</div>

	<script src="js/validator.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			Validator({
				form : '#form-1',
				formGroupSelector : '.form-group',
				errorSelector : '.form-message',
				rules : [
						Validator.isRequired('#email', 'Enter Your Email.'),
						Validator.isEmail('#email'),
						Validator.isRequired('#password',
								'Enter Your Password.'),
						Validator.minLength('#password', 6), ],
				onSubmit : function(data) {
					console.log(data);
				}
			});

		});
	</script>
</body>

</html>