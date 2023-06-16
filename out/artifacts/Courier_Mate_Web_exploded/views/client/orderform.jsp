<div class="container">
    <h2 class="mt-4">Order Delivery</h2>
    <div class="d-flex justify-content-between">
        <form action="addorder" method="post" style="margin-top: 2rem">
            <div class="mb-1">
                <label for="travelDistance" class="form-label">Travel Distance</label>
                <input name="travelDistance" type="text" class="form-control" id="travelDistance" aria-describedby="travelDistanceHelp" disabled>
                <div id="travelDistanceHelp" class="form-text">Disabled: auto-retrieved from the map.</div>
            </div>
            <div class="mb-1">
                <label for="travelTime" class="form-label">Travel Time</label>
                <input name="travelTime" type="text" class="form-control" id="travelTime" aria-describedby="travelTimeHelp" disabled>
                <div id="travelTimeHelp" class="form-text">Disabled: auto-retrieved from the map.</div>
            </div>

            <div class="md-3">
                <label for="paymentType" class="form-label">Payment Type</label>
                <select class="form-select" id="paymentType" name="paymentType" required>
                    <option selected disabled value="">Choose...</option>
                    <option value="CASH">CASH</option>
                    <option value="CREDIT_CARD">CREDIT_CARD</option>
                </select>
            </div>
            <div class="md-3">
                <label for="courier" class="form-label">Courier</label>
                <select class="form-select" id="courier" name="courier" required>
                    <option selected disabled value="">Choose...</option>
                    <option value="courier_id">John Doe, Reputation: (High, Medium, Low)</option>
                    <option value="courier_id">Jane Doe, Reputation: (High, Medium, Low)</option>
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