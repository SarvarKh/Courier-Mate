<%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 23/06/23
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sarvar.group.domains.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="sarvar.group.domains.Courier" %>
<html>
<head>
    <title>Submitted Couriers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <style type="text/css">
        table td:nth-child(5) {
            display: none;
        }
        table th:nth-child(5) {
            display: none;
        }
    </style>
</head>
<body>
<div style="background-image: url('../../assets/img/nyc2.jpeg'); background-attachment: fixed;
                background-size: cover; height: 100%">
    <%@include file="navbaradmin.jsp"%>
    <div class="container">
        <div class="row needs-validation bg-body-secondary rounded p-1" novalidate style="top: 10rem; position: absolute;">
            <div style="color: #fff">
                <div style="top: 10rem;">
                    <table class="table mt-2">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone Number</th>
                            <th scope="col">Active</th>
                            <th scope="col">Approval</th>
                            <th scope="col">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% List<Courier> couriers = (List<Courier>) request.getAttribute("couriers"); %>
                        <%if (couriers != null && couriers.size() > 0) { %>
                            <%for (int i = 0; i < couriers.size(); i++) {%>
                            <tr>
                                <th scope="row"><%=i+1%></th>
                                <td><%=couriers.get(i).getFirstName()%></td>
                                <td><%=couriers.get(i).getLastName()%></td>
                                <td><%=couriers.get(i).getEmail()%></td>
                                <td><%=couriers.get(i).getPhoneNumber()%></td>
                                <td><%=couriers.get(i).getActive()%></td>
                                <td><%=couriers.get(i).getApproval()%></td>
                                <td class="d-flex flex-row">
                                    <form action="approval-request" method="post" class="mx-2" style="margin-bottom: 0px">
<%--                                        Courier Object--%>
                                        <input type="hidden" name="id" value="<%=couriers.get(i).getId()%>">
                                        <input type="hidden" name="firstName" value="<%=couriers.get(i).getFirstName()%>">
                                        <input type="hidden" name="lastName" value="<%=couriers.get(i).getLastName()%>">
                                        <input type="hidden" name="email" value="<%=couriers.get(i).getEmail()%>">
                                        <input type="hidden" name="phoneNumber" value="<%=couriers.get(i).getPhoneNumber()%>">
                                        <input type="hidden" name="active" value="<%=couriers.get(i).getActive()%>">
                                        <input type="password" name="password" value="<%=couriers.get(i).getPassword()%>" style="display: none">
                                        <input type="hidden" name="approval" value="APPROVED">

                                        <button type="submit" class="btn btn-success">Approve</button>
                                    </form>
                                    <form action="approval-request" method="post" class="mx-1" style="margin-bottom: 0px">
                                        <%--                                        Courier Object--%>
                                        <input type="hidden" name="id" value="<%=couriers.get(i).getId()%>">
                                        <input type="hidden" name="firstName" value="<%=couriers.get(i).getFirstName()%>">
                                        <input type="hidden" name="lastName" value="<%=couriers.get(i).getLastName()%>">
                                        <input type="hidden" name="email" value="<%=couriers.get(i).getEmail()%>">
                                        <input type="hidden" name="phoneNumber" value="<%=couriers.get(i).getPhoneNumber()%>">
                                        <input type="hidden" name="active" value="<%=couriers.get(i).getActive()%>">
                                        <input type="password" name="password" value="<%=couriers.get(i).getPassword()%>" style="display: none">
                                        <input type="hidden" name="approval" value="REJECTED">

                                        <input type="hidden" name="courierId" value="<%=couriers.get(i).getId()%>">
                                        <button type="submit" class="btn btn-danger">Reject</button>
                                    </form>
                                </td>
                                <%--                                <td><a class="btn btn-primary" href="order-detail?orderId=<%=orders.get(i).getId()%>">View</a></td>--%>
                            </tr>
                            <%}%>
                            <tr>
                                <td colspan="7">
                                    <strong>Pending requests: <%= couriers.size() %></strong>
                                </td>
                            </tr>
                        <% } else { %>
                            <tr>
                                <td scope="row" colspan="9">No pending / submitted courier requests yet.</td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
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
