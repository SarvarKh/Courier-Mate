package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.dao.DBResult;
import sarvar.group.domains.Order;
import sarvar.group.domains.Transport;
import sarvar.group.domains.util.PaymentType;
import sarvar.group.domains.util.Status;
import sarvar.group.domains.util.TransportType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/update-order-status")
public class UpdateOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        Double travelDistance = Double.valueOf(req.getParameter("travelDistance"));
        Double travelTime = Double.valueOf(req.getParameter("travelTime"));
        PaymentType paymentType = PaymentType.valueOf(req.getParameter("paymentType"));
        Integer courierId = Integer.valueOf(req.getParameter("courierId"));
        Integer clientId = Integer.valueOf(req.getParameter("clientId"));
        Integer rate = Integer.valueOf(req.getParameter("rate"));
        Double totalAmount = Double.valueOf(req.getParameter("totalAmount"));
        Status status = Status.valueOf(req.getParameter("deliveryStatus"));

        Order order = new Order(id, travelDistance, travelTime, paymentType,
                courierId, clientId, rate, totalAmount, status);


        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");
        ApplicationDAO dao = new ApplicationDAO();

        DBResult dbResult = null;
        try {
            dbResult = dao.updateOrder(order, connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);
        req.setAttribute("orderId", id);
        req.setAttribute("courierId", courierId);


        RequestDispatcher reqd = req.getRequestDispatcher("order-detail");
        reqd.forward(req, resp);
    }
}
