<%@ page import="sarvar.group.domains.Courier" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sarvarkhalimov
  Date: 10/06/23
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Delivery</title>
    <script src="https://api-maps.yandex.ru/2.1/?lang=en_US" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/ea61045147.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <div style="background-color: rgba(220, 220, 220, 0.9); background-attachment: fixed;
            background-size: cover; height: 100%">
        <%@include file="navbarclient.jsp"%>
        <div class="container">
            <h2 class="mt-4">Order Delivery</h2>
            <div class="d-flex justify-content-between">
                <form action="addorder" method="post" style="margin-top: 2rem">

                    <input name="travelDistance" value="" type="text" class="form-control" id="travelDistance" aria-describedby="travelDistanceHelp" disabled>
                    <input name="travelTime" value="" type="text" class="form-control" id="travelTime" aria-describedby="travelTimeHelp" disabled>

                    <div class="md-3">
                        <label for="paymentType" class="form-label">Payment Type</label>
                        <select class="form-select" id="paymentType" name="paymentType" required>
                            <option selected disabled value="">Choose...</option>
                            <option value="CASH">CASH</option>
                            <option value="CREDIT_CARD">CREDIT_CARD</option>
                        </select>
                    </div>
                    <div class="md-3">
                        <label for="courier" class="form-label">Available Couriers (ACCEPTING_ORDERS)</label>
                        <select class="form-select" id="courier" name="courier" required>
                            <option selected disabled value="">Choose...</option>
                            <% List<Courier> couriers = (List<Courier>) request.getAttribute("couriers"); %>
                            <%if (couriers != null && couriers.size() > 0) { %>
                            <%for (int i = 0; i < couriers.size(); i++) {%>
                            <option value="<%= couriers.get(i).getId()%>%>">
                                <%=couriers.get(i).getFirstName() + " " + couriers.get(i).getLastName() + ", " +
                                        couriers.get(i).getPhoneNumber()%>
<%--                                Reputation: (High, Medium, Low)--%>
                            </option>
                            <%}%>
                            <% } else { %>
                            <option selected disabled value="">No courier is avilable now, try later</option>
                            <% } %>
                        </select>
                    </div>
                    <input type="hidden" name="clientId" value="<%= session.getAttribute("clientId") %>">
                    <div class="md-3">
                        <label for="transport" class="form-label">Courier's Transport</label>
                        <select class="form-select" id="transport" name="transport" required>
                            <option selected disabled value="">Choose...</option>
                            <option value="transport_id">BICYCLE, Rate: 2 $/km</option>
                            <option value="transport_id">CAR, Rate: 8 $/km</option>
                            <option value="transport_id">DRONE, Rate: 11 $/km</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="totalAmount" class="form-label">Total amount</label>
                        <input name="totalAmount" type="text" class="form-control" id="totalAmount" aria-describedby="totalAmountHelp" disabled>
                        <div id="totalAmountHelp" class="form-text">Disabled: auto-calculated based on selections.</div>
                    </div>


                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Agree with terms & conditions.</label>
                    </div>
                    <div class="alert alert-danger" role="alert" id="error_message" style="display: none">
                        A simple danger alert—check it out!
                    </div>

                    <div class="col-12">
                        <button class="btn btn-primary" type="button" id="button" onclick="checkForm()">Add</button>
                    </div>
                </form>
                <div id="map" style="width:65vw;height:70vh; float: right; margin-top: 2rem; margin-left: 1rem"></div>
            </div>
        </div>
        <%@include file="../common/notification.jsp"%>
        <%@include file="../common/footer.jsp"%>
    </div>

    <script type="text/javascript">
        ymaps.ready(function () {
            var myMap = new ymaps.Map('map', {
                center: [55.753994, 37.622093],
                zoom: 9,
                controls: ['routePanelControl']
            });

            // Get a reference to the routing panel.
            var control = myMap.controls.get('routePanelControl');

            // SET ROUTE POINTS
            control.routePanel.state.set({
                // Address of the starting point.
                from: '16 Lva Tolstogo, Moscow',
                // Address of the ending point.
                to: 'Cheryomushki metro station'
            });

            // SET ROUTING TYPE
            control.routePanel.state.set({
                // For a list of all settings, see the reference guide.
                // The default routing type.
                type: "pedestrian",
            });

            control.routePanel.options.set({
                // Routing types that will be available
                // for users to select.
                // In the example, users can only build
                // a taxi route and a walking route.
                types: {
                    "pedestrian": true,
                    "taxi": true
                }
            });


            // BUILDING ROUTE that can be used to order a taxi
            control.routePanel.options.set({
                // Routing types to show on the panel.
                // Users can switch between these types.
                types: {
                    auto: true,
                    pedestrian: true,
                    // Add the “taxi” icon
                    // to the panel.
                    taxi: true
                }
            });

            control.routePanel.state.set({
                // Use the route with the taxi button
                // by default.
                type: "taxi",
                from: '16 Lva Tolstogo, Moscow',
                to: 'Cheryomushki metro station'
            });


            // SETTING PANEL SIZE AND POSITION
            control.options.set({
                // For a list of all settings, see the reference guide.
                maxWidth: '180px',
                float: 'right'
            });


            // GETTING INFO ABOUT CREATED ROUTE
            var multiRoutePromise = control.routePanel.getRouteAsync();
            multiRoutePromise.then(function(multiRoute) {
                // Subscribe to the multiroute update event.
                multiRoute.model.events.add('requestsuccess', function() {
                    // Get a reference to the active route.
                    var activeRoute = multiRoute.getActiveRoute();
                    // When the panel is added to the map, it
                    // creates a route with an initially empty geometry.
                    // When the user selects the start and ending points,
                    // the route is recalculated with a non-empty geometry.
                    // In order to avoid errors, we must add a check
                    // to make sure that the route is not empty.
                    if (activeRoute) {
                        // Output information about the active route.
                        var oDistance = activeRoute.properties.get("distance").text;
                        var oTravelTime = activeRoute.properties.get("duration").text;
                        console.log("Distance: " + oDistance);
                        console.log("Travel time: " + oTravelTime);

                        document.getElementById("travelDistance").setAttribute("value", oDistance);
                        document.getElementById("travelDistance").innerHTML = oDistance.toString();
                        document.getElementById("travelTime").setAttribute("value", oTravelTime);
                        document.getElementById("travelTime").innerHTML = oTravelTime.toString();
                    }
                });
            }, function (err) {
                console.log(err);
            });
        });
    </script>
    <script type="text/javascript">
        function checkForm() {
            let rate = document.getElementById("rate").value;
            let transportType = document.getElementById("transportType").value;
            let errorMessage = [""];

            if (rate < 1 || rate >= 100) {
                errorMessage.push("Rate must be in range between 1 and 100 (unit is USD/km)");
            };
            if (transportType == "") {
                errorMessage.push("Transport Type must be selected");
            }

            if (errorMessage.length <= 1) {
                document.getElementById("button").setAttribute("type", "submit");
            } else {
                document.getElementById("error_message").setAttribute("style", "display: block");
                document.getElementById("error_message").innerHTML = errorMessage.toString();
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
