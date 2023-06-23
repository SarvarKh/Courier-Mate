<%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 23/06/23
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 10/06/23
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Submission rejected</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div style="background-image: url('../../assets/img/nys1.jpeg'); background-attachment: fixed;
            background-size: cover; height: 100%">
  <%@include file="navbarcourier.jsp"%>
  <div class="container">
    <div class="d-flex justify-content-center">
      <div class="card mt-3" style="width: 28rem;">
        <img src="../../assets/img/suspicious.jpeg" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Sorry, your submission was rejected by admin.</h5>
          <p class="card-text">Reasons might be your added invalid or suspicious data for your courier profile.</p>
          <a href="couriersignup" class="btn btn-primary">Sign up</a>
        </div>
      </div>
    </div>
  </div>
  <%@include file="../common/notification.jsp"%>
  <%@include file="../common/footer.jsp"%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
</script>
</body>
</html>