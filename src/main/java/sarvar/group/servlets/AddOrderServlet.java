package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.dao.DBResult;
import sarvar.group.domains.Order;
import sarvar.group.domains.util.PaymentType;
import sarvar.group.domains.util.Status;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/add-order")
public class AddOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order = new Order();
        order.setTravelDistance(Double.valueOf(req.getParameter("travelDistance")));
        order.setTravelTime(Double.valueOf(req.getParameter("travelTime")));
        order.setPaymentType(PaymentType.valueOf(req.getParameter("paymentType")));
        order.setCourierId(Integer.valueOf(req.getParameter("courier")));
        order.setClientId(Integer.valueOf(req.getParameter("clientId")));
        order.setRate(Integer.valueOf(req.getParameter("transport")));
        order.setTotalAmount(Double.valueOf(req.getParameter("totalAmount")));
        order.setStatus(Status.valueOf(req.getParameter("status")));

        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO dao = new ApplicationDAO();
        DBResult dbResult = null;
        try {
            dbResult = dao.addOrder(order, connection);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("DBResult", dbResult);

        RequestDispatcher reqd = req.getRequestDispatcher("my-orders");
        reqd.forward(req, resp);
    }
}
