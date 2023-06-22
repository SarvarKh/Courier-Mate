<div class="container">
  <form action="${pageContext.request.contextPath}/addtransport" method="post" class="row needs-validation bg-body-secondary rounded p-1" novalidate style="top: 10rem; position: absolute; width: fit-content">

    <div class="col-md-3">
      <label for="transportType" class="form-label">Transport Type</label>
      <select class="form-select" id="transportType" name="transportType" required>
        <option selected disabled value="">Choose...</option>
        <option value="BICYCLE">BICYCLE</option>
        <option value="QUAD_BIKE">QUAD_BIKE</option>
        <option value="DRONE">DRONE</option>
        <option value="CAR">CAR</option>
      </select>
    </div>
    <div class="col-md-4">
      <label for="rate" class="form-label">Rate per km in USD</label>
      <input name="rate" type="number" class="form-control" id="rate" required>
    </div>
    <input type="hidden" name="courierId" value="<%= session.getAttribute("courierId") %>">
<%--    <input type="hidden" name="courierId" value="<%= request.getParameter("courierId") %>">--%>

    <div class="alert alert-danger" role="alert" id="error_message" style="display: none">
      A simple danger alert—check it out!
    </div>

    <div class="col-12">
      <button class="btn btn-primary" type="button" id="button" onclick="checkForm()">Add</button>
    </div>
  </form>
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
