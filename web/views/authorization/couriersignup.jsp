<%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 10/06/23
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authorization</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
  <div style="background-image: url('../../assets/img/nys1.jpeg'); background-attachment: fixed;
    background-size: cover; height: 100%">
      <div class="container">
          <form action="/courier" method="post" class="row needs-validation bg-body-secondary rounded p-1" novalidate style="top: 5rem; position: absolute; width: 80%;">
              <div class="col-md-4">
                  <label for="firstName" class="form-label">First name</label>
                  <input name="firstName" type="text" class="form-control" id="firstName" required>
              </div>
              <div class="col-md-4">
                  <label for="lastName" class="form-label">Last name</label>
                  <input name="lastName" type="text" class="form-control" id="lastName" required>
              </div>
              <div class="col-md-4">
                  <label for="email" class="form-label">Email</label>
                  <input name="email" type="text" class="form-control" id="email" required>
              </div>
              <div class="col-md-4">
                  <label for="phoneNumber" class="form-label">Phone Number</label>
                  <input name="phoneNumber" type="text" class="form-control" id="phoneNumber" required>
              </div>
              <div class="col-md-3">
                  <label for="active" class="form-label">Activity_Status</label>
                  <select class="form-select" id="active" name="active" required>
                      <option selected disabled value="">Choose...</option>
                      <option value="ACCEPTING_ORDERS">ACCEPTING_ORDERS (I'm available to deliver now)</option>
                      <option value="NOT_ACCEPTING_ORDERS">NOT_ACCEPTING_ORDERS (I'll sign up, may accept orders later)</option>
                  </select>
              </div>
              <div class="col-md-4">
                  <label for="password" class="form-label">Password</label>
                  <input name="password" type="text" class="form-control" id="password" required>
              </div>
              <div class="alert alert-danger" role="alert" id="error_message" style="display: none">
                  A simple danger alert—check it out!
              </div>

              <div class="col-12">
                  <button class="btn btn-primary" type="button" id="button" onclick="checkForm()">Sign up</button>
              </div>
          </form>
      </div>
      <%@include file="../common/footer.jsp"%>
  </div>
  <script type="text/javascript">
      function checkForm() {
          let firstName = document.getElementById("firstName").value;
          let lastName = document.getElementById("lastName").value;
          let email = document.getElementById("email").value;
          let phoneNumber = document.getElementById("phoneNumber").value;
          let active = document.getElementById("active").value;
          let password = document.getElementById("password").value;
          let errorMessage = [""];

          if (firstName.length == 0) {
              errorMessage.push("First Name must not be empty");
          };
          if (lastName.length == 0) {
              errorMessage.push("Last Name must not be empty");
          }
          if (email.length <= 4) {
              errorMessage.push("Email must be at least 5 characters");
          }
          if (7 < phoneNumber.length && 14 < phoneNumber.length) {
              errorMessage.push("Phone number must be between 8 and 13 characters");
          }
          if(active.length == 0) {
              errorMessage.push("Activity Status must not be empty");
          }
          if (password.length <= 4) {
              errorMessage.push("Password must be at least 5 characters");
          }


          if (errorMessage.length <= 1) {
              document.getElementById("button").setAttribute("type", "submit");
          } else {
              document.getElementById("error_message").setAttribute("style", "display: block");
              document.getElementById("error_message").innerHTML = errorMessage.toString();
          }
      }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
  </script>
</body>
</html>
