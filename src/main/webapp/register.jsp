<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="style_login.css">

  <title>Register</title>
</head>

<body>
  
  <div class="main">
    <div class="container-fluid">
      <form class="mx-auto my-5 form-register" action="register" method="post" id="form-1">
        <h4 class="text-center">Register</h4>
        
        <c:if test="${not empty succMsg }">
        	<p class="text-center text-success">${succMsg } </p>
        	<c:remove var="succMsg" scope="session"/>
        </c:if>

		<c:if test="${not empty failedMsg }">
        	<p class="text-center text-danger">${failedMsg } </p>
        	<c:remove var="failedMsg" scope="session"/>
        </c:if>
		
        <div class="form-group mb-2 mt-5">
          <label for="fullname" class="form-label">Full Name</label>
          <input type="text" class="form-control" name="fullname" id="fullname">
          <span class="form-message"></span>
        </div>

        <div class="form-group mb-1">
          <label for="email" class="form-label">Email</label>
          <input type="text" class="form-control" name="email" id="email">
          <span class="form-message"></span>
        </div>

        <div class="form-group mb-3">
          <label for="phone" class="form-label">Phone Number</label>
          <input type="text" class="form-control" name="phone" id="phone">
          <span class="form-message"></span>
        </div>

        <div class="form-group mb-3">
          <label for="address" class="form-label">Address</label>
          <input type="text" class="form-control" name="address" id="address">
          <span class="form-message"></span>
        </div>

        <div class="form-group mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" name="password" id="password">
          <span class="form-message"></span>
        </div>
<button type="submit" class="btn btn-primary">Submit</button>
        
        <!-- <div class="form-group">
          <input type="submit" name="submit" class="btn btn-primary mt-5" value="Sign up">
        </div> -->
        <p class="text-center mt-3">Already have an account? <a href="login.jsp" style="text-decoration: none;">Login now</a></p>
      </form>
    </div>
  </div>


  <script src="js/validator.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      Validator({
        form: '#form-1',
        formGroupSelector: '.form-group',
        errorSelector: '.form-message',
        rules: [
          Validator.isRequired('#fullname', 'Enter Your Fullname.'),
          Validator.isRequired('#address', 'Enter Your Address.'),
          Validator.isRequired('#phone', 'Enter Your Phone Number.'),
          Validator.isRequired('#email', 'Enter Your Email.'),
          Validator.isEmail('#email'),
          Validator.minLength('#password', 6),
          Validator.isRequired('#password_confirmation'),
          // Validator.isConfirmed('#password_confirmation', function() {
          //   return document.querySelector('#form-1 #password').value;
          // }, 'Re-entered password is incorrect')
        ],
        onSubmit: function(data) {
          // Call API
          console.log(data);
        }
      });
    });
  </script>
</body>

</html>