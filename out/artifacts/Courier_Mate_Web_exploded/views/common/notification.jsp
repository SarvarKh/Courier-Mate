<%@ page import="sarvar.group.service.DBResult" %>
<% if(request.getAttribute("DBResult") == null) { %>
<span style="color: white">
<%--    <h1>TRUE: DBResult attribute don't exist !!!!!!!!!!!!</h1>--%>
</span>
<% } else { %>

<div style="color: white">
<%--    <h1>FALSE: DBResult attribute exist!!!!!!!!!!!!</h1>--%>
    <% DBResult dbResult = (DBResult)request.getAttribute("DBResult"); %>
    <% if (dbResult.isSuccess()) {%>
        <div>
            <div class="toast-container position-fixed bottom-0 end-0 p-3" id="toast1">
                <div id="liveToast1" class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="display: block; visibility: visible; background-color: #d1e7dd">
                    <div class="toast-header" style="background-color: #d1e7dd">
                        <strong class="me-auto">Successfully processed</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body">
                        <strong>Server processed the input / request:</strong> <% dbResult.getMessage(); %>
                    </div>
                </div>
            </div>
        </div>
    <% } else { %>
        <div>
            <div class="toast-container position-fixed bottom-0 end-0 p-3" id="toast">
                <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true" style="display: block; visibility: visible; background-color: #f1aeb5">
                    <div class="toast-header" style="background-color: #f1aeb5">
                        <strong class="me-auto">Unsuccessful processing</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body">
                        <strong>Server invalidated the input / request:</strong> <% dbResult.getMessage(); %>
                    </div>
                </div>
            </div>
        </div>
    <% } %>
</div>
<% } %>



<script type="text/javascript">
    setTimeout(myGreeting, 5000);

    function myGreeting() {
        document.getElementById("toast").setAttribute("style", "display: none");
        document.getElementById("toast1").setAttribute("style", "display: none");
    }

    function callToast() {
        const toastLiveExample = document.getElementById('liveToast')
        const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
        toastBootstrap.show()

        const toastLiveExample1 = document.getElementById('liveToast1')
        const toastBootstrap1 = bootstrap.Toast.getOrCreateInstance(toastLiveExample1)
        toastBootstrap1.show()


    }
    callToast();
</script>