<%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 12/06/23
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Client Profile</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
  <div style="background-image: url('../../assets/img/nyc2.jpeg'); background-attachment: fixed;
              background-size: cover; height: 100%">
    <%@include file="navbarclient.jsp"%>

    <h1 style="color: #fff">Success. This is client page</h1>
    <div>This is client profile page</div>

    <%@include file="../common/notification.jsp"%>
    <%@include file="../common/footer.jsp"%>
  </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
</script>
</body>
</html>
