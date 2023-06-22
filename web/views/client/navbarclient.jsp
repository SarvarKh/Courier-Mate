<div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="padding: 0; opacity: 80%;">
        <div class="container-fluid">
            <a class="nav-link active" aria-current="page" href="/">
                <img src="./assets/img/logo.png" class="img-thumbnail" width="80" height="80" alt="Logo">
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Safety</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Help</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <a class="btn " href="#">Profile</a>
                        <form action="/all-couriers" method="post" style="margin-block-end: 0px">
                            <button class="btn" type="submit">Place an order</button>
                        </form>
                        <form action="/my-orders" method="post" style="margin-block-end: 0px">
                            <button class="btn" type="submit">My orders</button>
                        </form>
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <a class="btn" href="/courierlogout">Log out</a>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>