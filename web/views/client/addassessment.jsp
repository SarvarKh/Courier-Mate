<form action="add-assessment" method="post" style="margin-top: 2rem; width: 35vw">
    <div class="md-1">
        <label for="timeliness" class="form-label">Timeliness</label>
        <input type="range" name="timeliness" class="form-range" min="1" max="3" step="1" id="timeliness" required>
        <div class="d-flex justify-content-between" style="color: #b3b3b3">
            <div>Bad</div>
            <div>Neutral</div>
            <div>Good</div>
        </div>
    </div>
    <div class="md-1">
        <label for="condition" class="form-label">Condition</label>
        <input type="range" name="condition" class="form-range" min="1" max="3" step="1" id="condition" required>
        <div class="d-flex justify-content-between" style="color: #b3b3b3">
            <div>Bad</div>
            <div>Neutral</div>
            <div>Good</div>
        </div>
    </div>
    <div class="md-1">
        <label for="communication" class="form-label">Communication</label>
        <input type="range" name="communication" class="form-range" min="1" max="3" step="1" id="communication" required>
        <div class="d-flex justify-content-between" style="color: #b3b3b3">
            <div>Bad</div>
            <div>Neutral</div>
            <div>Good</div>
        </div>
    </div>
    <br>

    <div class="md-1">
        <label for="clientFirstName" class="form-label">Client (your) name</label>
        <input value="<%= clientFirstName %>" name="clientFirstName" type="text" class="form-control" id="clientFirstName" aria-label="readonly input example" readonly>
    </div>
    <div class="md-1">
        <label for="clientEmail" class="form-label">Client (your) email</label>
        <input value="<%= clientEmail %>" name="clientEmail" type="email" class="form-control" id="clientEmail" aria-label="readonly input example" readonly>
    </div>
    <br>

    <div class="md-1">
        <label for="courierFirstName" class="form-label">Courier name</label>
        <input value="<%= courierFirstName %>" name="courierFirstName" type="text" class="form-control" id="courierFirstName" aria-label="readonly input example" readonly>
    </div>
    <div class="md-1">
        <label for="courierEmail" class="form-label">Courier Email</label>
        <input value="<%= courierEmail %>" name="courierEmail" type="text" class="form-control" id="courierEmail" aria-label="readonly input example" readonly>
    </div>

<%--    To be hidden--%>
    <input type="hidden" name="clientId" value="<%= session.getAttribute("clientId") %>" id="clientId">
    <input type="hidden" name="courierId" value="<%= courierId %>" id="courierId">
    <input type="hidden" name="orderId" value="<%= order.getId() %>" id="orderId">

    <div class="alert alert-danger" role="alert" id="error_message" style="display: none">
        A simple danger alert—check it out!
    </div>

    <div class="col-12">
        <button class="btn btn-primary" type="button" id="button" onclick="checkForm()">Submit</button>
    </div>
</form>

<%--    Form validation--%>
<script type="text/javascript">
    function checkForm() {
        let timeliness = document.getElementById("timeliness").value;
        let condition = document.getElementById("condition").value;
        let communication = document.getElementById("communication").value;
        let errorMessage = ["ERRORs: "];

        if (timeliness.length == 0) {
            errorMessage.push("Timeliness must be between 1 & 3");
        };
        if (condition.length == 0) {
            errorMessage.push("Condition must be between 1 & 3");
        };
        if (communication.length == 0) {
            errorMessage.push("Communication must be between 1 & 3");
        };

        if (errorMessage.length <= 1) {
            document.getElementById("button").setAttribute("type", "submit");
        } else {
            document.getElementById("error_message").setAttribute("style", "display: block");
            document.getElementById("error_message").innerHTML = errorMessage.toString();
        }
    }
</script>