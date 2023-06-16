<%@ page import="java.util.List" %>
<%@ page import="sarvar.group.domains.Transport" %>
<div class="container">
    <div class="row needs-validation bg-body-secondary rounded p-1" novalidate style="top: 10rem; position: absolute; width: 30vw">
        <div style="color: #fff">
            <div style="top: 10rem;">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Transport Type</th>
                        <th scope="col">Rate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% List<Transport> transports = (List<Transport>) request.getAttribute("transports"); %>
                    <%if (transports != null && transports.size() > 0) { %>
                        <%for (int i = 0; i < transports.size(); i++) {%>
                            <tr>
                                <th scope="row"><%=i+1%></th>
                                <td><%=transports.get(i).getTransportType()%></td>
                                <td><%=transports.get(i).getRate()%></td>
                            </tr>
                        <%}%>
                    <% } else { %>
                        <tr>
                            <td scope="row" colspan="3">No transport was added yet.</td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>