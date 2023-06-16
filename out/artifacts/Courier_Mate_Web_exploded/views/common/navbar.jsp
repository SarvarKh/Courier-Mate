<div>
  <nav class="navbar navbar-expand-lg bg-body-tertiary" style="padding: 0; opacity: 80%;">
    <div class="container-fluid">
      <a class="nav-link active" aria-current="page" href="/">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" class="img-thumbnail" width="80" height="80" alt="Logo">
      </a>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/home.jsp#home">Home</a>
          </li>
            <li class="nav-item">
                <a class="nav-link" href="/views/client/order.jsp">Order Delivery</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/home.jsp#safety">Safety</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Help</a>
            </li>
        </ul>
        <div class="d-flex">
<%--          <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>
<%--            <a class="dropdown-item" href="/views/authorization/couriersignup.jsp">Register</a>--%>
<%--          </ul>--%>
            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Registration
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <a class="btn" href="couriersignup" role="button">Sign up as Courier</a>
                                <a class="btn" href="clientsignup" role="button">Sign up as Client</a>
                                <a class="btn" href="courierlogin" role="button">Log in as Courier</a>
                                <a class="btn" href="clientlogin" role="button">Log in as Client</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </nav>
</div>