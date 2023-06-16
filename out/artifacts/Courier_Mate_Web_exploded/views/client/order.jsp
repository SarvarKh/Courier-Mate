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
                <form action="order" method="post" style="margin-top: 2rem">
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Transport</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                <div id="map" style="width:65vw;height:70vh; float: right; margin-top: 2rem"></div>
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
                        console.log("Distance: " + activeRoute.properties.get("distance").text);
                        console.log("Travel time: " + activeRoute.properties.get("duration").text);
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
