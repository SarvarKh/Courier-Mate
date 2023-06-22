package sarvar.group.servlets;

import sarvar.group.dao.ApplicationDAO;
import sarvar.group.domains.Order;
import sarvar.group.domains.Transport;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/order-detail")
public class GetOrderDetailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer orderId = req.getParameter("orderId") != null ?
                Integer.valueOf(req.getParameter("orderId")) : (Integer) req.getAttribute("orderId");
        Integer courierId = req.getParameter("courierId") != null ?
                Integer.valueOf(req.getParameter("courierId")) : (Integer) req.getAttribute("courierId");

        Connection connection = (Connection) getServletContext().getAttribute("dbconnection");

        ApplicationDAO dao = new ApplicationDAO();
        List<Object> orderAssessmentClientCourier = null;

        try {
            orderAssessmentClientCourier = dao.getOrderAssessmentClientCourier(orderId, connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("order", orderAssessmentClientCourier.get(0));
        req.setAttribute("assessment", orderAssessmentClientCourier.get(1));
        req.setAttribute("courierId", courierId);
        req.setAttribute("clientFirstName", orderAssessmentClientCourier.get(2));
        req.setAttribute("clientEmail", orderAssessmentClientCourier.get(3));
        req.setAttribute("courierFirstName", orderAssessmentClientCourier.get(4));
        req.setAttribute("courierEmail", orderAssessmentClientCourier.get(5));

        RequestDispatcher reqD = req.getRequestDispatcher("/views/client/orderdetails.jsp");
        reqD.forward(req, resp);

    }
}
