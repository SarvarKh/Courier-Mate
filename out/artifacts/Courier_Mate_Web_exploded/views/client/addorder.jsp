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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                <form action="add-order" method="post" style="margin-top: 2rem">
<%--                    // To be HIDDEN: just for development (type="hidden")--%>
                    <input name="travelDistance" type="text" class="form-control" id="travelDistance" aria-describedby="travelDistanceHelp">
                    <input  name="travelTime" type="text" class="form-control" id="travelTime" aria-describedby="travelTimeHelp">

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
                            <option value="<%= couriers.get(i).getId()%>">
                                <%=couriers.get(i).getFirstName() + " " + couriers.get(i).getLastName() + ", " +
                                        couriers.get(i).getPhoneNumber()%>
<%--                                Reputation: (High, Medium, Low)--%>
                            </option>
                            <%}%>
                            <% } else { %>
                            <option selected disabled value="">No courier is available now, try later</option>
                            <% } %>
                        </select>
                    </div>
                    <input type="hidden" name="clientId" value="<%= session.getAttribute("clientId") %>">
                    <div class="md-3">
                        <label for="transport" class="form-label">Courier's Transports</label>
                        <select class="form-select" id="transport" name="transport" required onchange="calculateCost()">
                            <option selected disabled value="">Choose...</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="totalAmountDisplay" class="form-label">Total amount</label>
                        <input name="totalAmountDisplay" type="text" class="form-control" id="totalAmountDisplay" aria-describedby="totalAmountHelp" disabled>
                        <div id="totalAmountHelp" class="form-text">Disabled: auto-calculated based on selections.</div>
                    </div>
                    <input type="hidden" name="totalAmount" type="text" class="form-control" id="totalAmount" aria-describedby="totalAmountHelp">
                    <input type="hidden" name="status" value="PLACED">


                    <div class="mb-3 form-check">
                        <input name="agreement" type="checkbox" class="form-check-input" id="agreement">
                        <label class="form-check-label" for="agreement">Agree with terms & conditions.</label>
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

<%--    Form validation--%>
    <script type="text/javascript">
        function checkForm() {
            let travelDistance = document.getElementById("travelDistance").value;
            let agreement = document.getElementById("agreement");
            let totalAmount = document.getElementById("totalAmount").value;
            console.log("totalAmount: " + totalAmount);


            let errorMessage = ["ERRORs: "];

            if (travelDistance.length == 0) {
                errorMessage.push("Start & end destinations must be selected");
            };
            if (!agreement.checked) {
                errorMessage.push("You must agree before ordering delivery - click on agreement checkbox");
            }
            if (totalAmount.length == 0) {
                errorMessage.push("Total amount can't be empty - please ensure all fields are selected");
            }

            if (errorMessage.length <= 1) {
                document.getElementById("button").setAttribute("type", "submit");
            } else {
                document.getElementById("error_message").setAttribute("style", "display: block");
                document.getElementById("error_message").innerHTML = errorMessage.toString();
            }
        }
    </script>

<%--    AJAX request to get transports based on selected courier AND calculate cost of trip--%>
    <script>
        $(document).ready(function() {
            $('#courier').on('change', function() {
                var selectedCourier = $(this).val();
                $.ajax({
                    url: 'get-transports',
                    type: 'GET',
                    dataType: 'json',
                    data: { courierId: selectedCourier },
                    success: function(response) {
                        // var transports = JSON.parse(response);
                        $('#transport').empty();
                        for (var i = 0; i < response.length; i++) {
                            var transport = response[i];
                            $('#transport').append($('<option>', {
                                value: transport.rate,
                                text: (transport.transportType + ", " + transport.rate + " USD/km")
                            }));
                        }
                    }
                });
            });
        });

        function calculateCost() {
            const rate = parseInt(document.getElementById("transport").value);
            const travelDistance = parseFloat(document.getElementById("travelDistance").value);
            let cost = rate * travelDistance;

            document.getElementById("totalAmountDisplay").value = cost.toFixed(2);
            document.getElementById("totalAmount").value = cost.toFixed(2);
        }
    </script>

<%--    Yandex Map API--%>
    <script type="text/javascript">
        ymaps.ready(function () {
            var myMap = new ymaps.Map('map', {
                center: [41.327557, 69.292973],
                zoom: 12,
                controls: ['routePanelControl']
            });

            // Get a reference to the routing panel.
            var control = myMap.controls.get('routePanelControl');

            // SET ROUTE POINTS
            control.routePanel.state.set({
                // Address of the starting point.
                from: 'turkestan metro station',
                // Address of the ending point.
                to: 'Mirzo Ulugbek metro station'
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
                from: 'turkestan metro station',
                to: 'Mirzo Ulugbek metro station'
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

                        // To be included: for production - Yandex map API key inclusion
                        // document.getElementById("travelDistance").value = oDistance.slice(0, -3);
                        // document.getElementById("travelTime").value = oTravelTime.slice(0, -4);

                        // To be deleted after testing: just for development
                        document.getElementById("travelDistance").value = oDistance;
                        document.getElementById("travelTime").value = oTravelTime;
                    }
                });
            }, function (err) {
                console.log(err);
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
