<%@ page import="sarvar.group.domains.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 18/06/23
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <div style="background-image: url('../../assets/img/nyc2.jpeg'); background-attachment: fixed;
                background-size: cover; height: 100%">
        <%@include file="navbarclient.jsp"%>
        <div class="container">
            <div class="row needs-validation bg-body-secondary rounded p-1" novalidate style="top: 10rem; position: absolute;">
                <div style="color: #fff">
                    <div style="top: 10rem;">
                        <table class="table mt-2">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Travel Distance</th>
                                <th scope="col">Travel Time</th>
                                <th scope="col">PaymentType</th>
                                <th scope="col">Courier Id</th>
                                <th scope="col">Rate</th>
                                <th scope="col">Total Amount</th>
                                <th scope="col">Status</th>
                                <th scope="col">Details</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
                            <%if (orders != null && orders.size() > 0) { %>
                            <% Double totalAmount = 0.0; %>
                            <%for (int i = 0; i < orders.size(); i++) {%>
                            <tr>
                                <th scope="row"><%=i+1%></th>
                                <td><%=orders.get(i).getTravelDistance()%></td>
                                <td><%=orders.get(i).getTravelTime()%></td>
                                <td><%=orders.get(i).getPaymentType()%></td>
                                <td><%=orders.get(i).getCourierId()%></td>
                                <td><%=orders.get(i).getRate()%></td>
                                <td>$ <%=orders.get(i).getTotalAmount()%></td>
                                <% totalAmount += orders.get(i).getTotalAmount(); %>
                                <td><%=orders.get(i).getStatus()%></td>
                                <td>
                                    <form action="order-detail" method="post">
                                        <input type="hidden" name="courierId" value="<%=orders.get(i).getCourierId()%>">
                                        <input type="hidden" name="orderId" value="<%=orders.get(i).getId()%>">
                                        <button type="submit" class="btn btn-primary">View Details</button>
                                    </form>
                                </td>
<%--                                <td><a class="btn btn-primary" href="order-detail?orderId=<%=orders.get(i).getId()%>">View</a></td>--%>
                            </tr>
                            <%}%>
                            <tr>
                                <td colspan="9">
                                    <strong>GRAND TOTAL $ <%=totalAmount%></strong>
                                </td>
                            </tr>
                            <% } else { %>
                            <tr>
                                <td scope="row" colspan="9">No order was placed yet.</td>
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
