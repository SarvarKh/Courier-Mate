<%@ page import="sarvar.group.service.DBConnection" %><%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 09/06/23
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Courier Mate</title>
    <script src="https://kit.fontawesome.com/ea61045147.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<%
    DBConnection dbConnection = new DBConnection();
%>
    <div style="background-image: url('./assets/img/nys1.jpeg'); background-attachment: fixed;
  background-size: cover; height: 100%">
        <%@ include file="views/common/navbar.jsp"%>
        <%@ include file="views/welcome.jsp"%>
        <%@ include file="views/common/footer.jsp"%>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
