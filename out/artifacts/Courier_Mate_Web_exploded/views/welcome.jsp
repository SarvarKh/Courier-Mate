<div>
    <div class="container" style="opacity: 80%;">
        <div class="d-flex align-items-center">
            <div class="accordion" id="accordionPanelsStayOpenExample" style="width: 50%; margin-top: 3rem">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                            <i class="fas fa-truck"></i> <span class="ms-3"> Deliver</span>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
                        <div class="accordion-body">
                            <strong>Get in the driver's seat and get paid</strong>
                            <div>
                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/views/authorization/couriersignup.jsp" role="button">Sign up</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                            <i class="fas fa-map-marked"></i> <span class="ms-3"> Order delivery</span>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <form>
                                <div class="input-group mb-3">
                                    <div class="input-group-text">
                                        <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input">
                                    </div>
                                    <input type="text" class="form-control" aria-label="Text input with checkbox" placeholder="Enter pick up location">
                                </div>

                                <div class="input-group">
                                    <div class="input-group-text">
                                        <input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
                                    </div>
                                    <input type="text" class="form-control" aria-label="Text input with radio button" placeholder="Enter destination">
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>