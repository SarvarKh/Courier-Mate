<%@ page import="sarvar.group.domains.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="sarvar.group.domains.Assessment" %><%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 18/06/23
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div style="background-image: url('../../assets/img/nyc2.jpeg'); background-attachment: fixed;
                background-size: cover; height: 100%">
    <%@include file="navbarclient.jsp"%>
    <div class="container">
        <div class="row needs-validation bg-body-secondary rounded p-1" style="width: 80vw; margin-top: 2rem">
            <% Order order = (Order) request.getAttribute("order"); %>
            <% Assessment assessment = (Assessment) request.getAttribute("assessment"); %>
            <% String clientFirstName = (String) request.getAttribute("clientFirstName"); %>
            <% String clientEmail = (String) request.getAttribute("clientEmail"); %>
            <% String courierFirstName = (String) request.getAttribute("courierFirstName"); %>
            <% String courierEmail = (String) request.getAttribute("courierEmail"); %>
            <% Integer courierId = (Integer) request.getAttribute("courierId"); %>
            <h2 class="mt-1">Order Details</h2>
            <div class="d-flex justify-content-between">
                <div style="margin-top: 2rem; width: 35vw">
                    <div class="md-1">
                        <label for="travelDistance" class="form-label">Travel Distance</label>
                        <input value="<%=order.getTravelDistance()%> km" name="travelDistance" type="text" class="form-control" id="travelDistance" aria-label="readonly input example" readonly>
                    </div>
                    <div class="md-1">
                        <label for="travelTime" class="form-label">Travel Time</label>
                        <input value="<%=order.getTravelTime()%> minutes" name="travelTime" type="text" class="form-control" id="travelTime" aria-label="readonly input example" readonly>
                    </div>
                    <div class="md-1">
                        <label for="paymentType" class="form-label">Payment Type</label>
                        <input value="<%=order.getPaymentType()%>" name="paymentType" type="text" class="form-control" id="paymentType" aria-label="readonly input example" readonly>
                    </div>
                    <div class="md-1">
                        <label for="rate" class="form-label">Rate</label>
                        <input value="$ <%=order.getRate()%> (USD/km)" name="rate" type="text" class="form-control" id="rate" aria-label="readonly input example" readonly>
                    </div>
                    <div class="md-1">
                        <label for="totalAmountDisplay" class="form-label">Total Amount</label>
                        <input value="$ <%=order.getTotalAmount()%>" name="totalAmountDisplay" type="text" class="form-control" id="totalAmountDisplay" aria-label="readonly input example" readonly>
                    </div>
                    <div class="md-1">
                        <label for="status" class="form-label">Status</label>
                        <input value="<%=order.getStatus()%>" name="status" type="text" class="form-control" id="status" aria-label="readonly input example" readonly>
                    </div>
                    <br>

                    <% if (order.getStatus().toString().equals("PLACED")) {%>
                        <form action="update-order-status" method="post" class="rounded text-bg-secondary p-1">
                            <div class="md-1">
                                <label for="deliveryStatus" class="form-label">Delivery status</label>
                                <select class="form-select" id="deliveryStatus" name="deliveryStatus" required>
                                    <option selected disabled value="">Choose...</option>
                                    <option value="INVOICED">Confirm delivery and issue invoice.</option>
                                    <option value="CANCELLED">Cancel this order</option>
                                </select>

<%--                                Order object--%>
                                <input type="hidden" name="id" value="<%=order.getId()%>">
                                <input type="hidden" name="travelDistance" value="<%=order.getTravelDistance()%>">
                                <input type="hidden" name="travelTime" value="<%=order.getTravelTime()%>">
                                <input type="hidden" name="paymentType" value="<%=order.getPaymentType()%>">
                                <input type="hidden" name="courierId" value="<%=order.getCourierId()%>">
                                <input type="hidden" name="clientId" value="<%=order.getClientId()%>">
                                <input type="hidden" name="rate" value="<%=order.getRate()%>">
                                <input type="hidden" name="totalAmount" value="<%=order.getTotalAmount()%>">
                                <input type="hidden" name="status" value="<%=order.getStatus()%>">
                            </div>

                            <button class="btn btn-primary" type="submit" id="submit">Submit</button>
                        </form>
                    <% } else if (order.getStatus().toString().equals("CANCELLED")) { %>
                        <div class="md-1 rounded text-bg-warning p-1">
                            <label for="CANCELLED" class="form-label">Status</label>
                            <input value="This order was cancelled" name="CANCELLED" type="text" class="form-control" id="CANCELLED" aria-label="readonly input example" readonly>
                        </div>
                    <% } else { %>
                        <div class="md-1 rounded text-bg-success p-1">
                            <label for="INVOICED" class="form-label">INVOICED</label>
                            <input value="This order was delivered and the invoice was issued" name="INVOICED" type="text" class="form-control" id="INVOICED" aria-label="readonly input example" readonly>
                        </div>
                    <% } %>
                </div>
                <% if (clientFirstName == null || courierFirstName == null) {%>
                    <%@include file="addassessment.jsp"%>
                <% } else { %>
                    <%@include file="showassessments.jsp"%>
                <% } %>
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
