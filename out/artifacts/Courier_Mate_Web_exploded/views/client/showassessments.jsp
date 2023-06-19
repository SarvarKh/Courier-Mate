<form style="margin-top: 2rem; width: 35vw">
    <div class="md-1">
        <label for="timeliness" class="form-label">Timeliness</label>
        <input class="form-control" type="text" value="<%= assessment.getTimeliness() %>" aria-label="readonly input example" id="timeliness" readonly>
    </div>
    <div class="md-1">
        <label for="condition" class="form-label">Condition</label>
        <input class="form-control" type="text" value="<%= assessment.getCondition() %>" aria-label="readonly input example" id="condition" readonly>
    </div>
    <div class="md-1">
        <label for="communication" class="form-label">Communication</label>
        <input class="form-control" type="text" value="<%= assessment.getTimeliness() %>" aria-label="readonly input example" id="communication" readonly>
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
</form>
